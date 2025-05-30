// ========================================
// File: BLECallbacks.cpp
// ========================================
#include "BLECallbacks.h"

bool eraseAckReceived = false;

void MyServerCallbacks::onConnect(BLEServer* pServer) {
  deviceConnected = true;
  digitalWrite(LED_PIN, HIGH);
  Serial.println("Device connected");
}

void MyServerCallbacks::onDisconnect(BLEServer* pServer) {
  deviceConnected = false;
  digitalWrite(LED_PIN, LOW);
  Serial.println("Device disconnected");
}

void MyCharacteristicCallbacks::onWrite(BLECharacteristic *pCharacteristic) {
  std::string value = pCharacteristic->getValue();
  Serial.println("Received: " + String(value.c_str()));

  // Check if the response is "RECV:ERASE"
  if (value == "RECV:ERASE") {
    eraseAckReceived = true; // Set the flag
  }
}