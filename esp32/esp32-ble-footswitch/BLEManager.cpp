// ========================================
// File: BLEManager.cpp
// ========================================
#include "BLEManager.h"
#include "BLECallbacks.h"
#ifdef ESP32
#include <esp_system.h>
#endif

// Global variables definition
bool deviceConnected = false;
const int LED_PIN = 18;

// Static member definitions
BLEServer* BLEManager::pServer = nullptr;
BLECharacteristic* BLEManager::pTxCharacteristic = nullptr;
bool BLEManager::oldDeviceConnected = false;

const char* BLEManager::SERVICE_UUID = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E";
const char* BLEManager::CHARACTERISTIC_UUID_RX = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E";
const char* BLEManager::CHARACTERISTIC_UUID_TX = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E";

void BLEManager::init(const char* deviceName) {
  // Initialize LED pin
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, LOW);

  // Create the BLE Device
  BLEDevice::init(deviceName);

  // Create the BLE Server
  pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  // Create the BLE Service
  BLEService *pService = pServer->createService(SERVICE_UUID);

  // Create a BLE Characteristic for TX (sending data to client)
  pTxCharacteristic = pService->createCharacteristic(
                    CHARACTERISTIC_UUID_TX,
                    BLECharacteristic::PROPERTY_NOTIFY
                  );
                      
  pTxCharacteristic->addDescriptor(new BLE2902());

  // Create a BLE Characteristic for RX (receiving data from client)
  BLECharacteristic * pRxCharacteristic = pService->createCharacteristic(
                       CHARACTERISTIC_UUID_RX,
                       BLECharacteristic::PROPERTY_WRITE
                     );

  pRxCharacteristic->setCallbacks(new MyCharacteristicCallbacks());

  // Start the service
  pService->start();

  // Start advertising
  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setScanResponse(false);
  pAdvertising->setMinPreferred(0x0);
  BLEDevice::startAdvertising();
  
  Serial.println("BLE Manager initialized. Waiting for client connection...");
}

void BLEManager::handleConnection() {
  // Handle disconnection
  if (!deviceConnected && oldDeviceConnected) {
    delay(500); // give the bluetooth stack time to get things ready
    pServer->startAdvertising(); // restart advertising
    Serial.println("Start advertising");
    oldDeviceConnected = deviceConnected;
  }
  
  // Handle connection
  if (deviceConnected && !oldDeviceConnected) {
    oldDeviceConnected = deviceConnected;
  }
}

void BLEManager::sendData(const String& data) {
  if (deviceConnected && pTxCharacteristic != nullptr) {
    pTxCharacteristic->setValue(data.c_str());
    pTxCharacteristic->notify();
    Serial.print("Sent data: ");
    Serial.println(data);
  }
}

void BLEManager::onDataReceived(const std::string &data) {
    Serial.println("Received data: " + String(data.c_str()));

    // Check if the response is "RECV:ERASE"
    if (data == "RECV:ERASE") {
        eraseAckReceived = true; // Set the flag
    }
}

bool BLEManager::isConnected() {
  return deviceConnected;
}
