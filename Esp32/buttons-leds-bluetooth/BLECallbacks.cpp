// ========================================
// File: BLECallbacks.cpp
// ========================================
#include "BLECallbacks.h"

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
  String rxValue = pCharacteristic->getValue();

  if (rxValue.length() > 0) {
    Serial.println("*********");
    Serial.print("Received Value: ");
    Serial.println(rxValue);
    Serial.println("*********");
  }
}