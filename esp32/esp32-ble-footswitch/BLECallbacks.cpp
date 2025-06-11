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
    // Get the value directly as a std::string
    std::string value = std::string(pCharacteristic->getValue().c_str());

    // Print the received data
    Serial.println("Received data: " + String(value.c_str())); // Convert std::string to String for Serial output

    // Check if the response is "RECV:ERASE"
    if (value == "RECV:ERASE") {
        eraseAckReceived = true; // Set the flag
    }
}