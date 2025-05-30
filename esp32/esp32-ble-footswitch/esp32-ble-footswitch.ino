// ========================================
// File: esp32-ble-temperature.ino (main Arduino file)
// ========================================
#include "BLEManager.h"
#include "BLECallbacks.h"
#include "FootSwitch.h"

FootSwitch footSwitch;
  
void setup() {
  Serial.begin(115200);
  
  // Initialize BLE Manager
  BLEManager::init("ESP32");
  footSwitch.init();
}

void sendErase() {
  if(!BLEManager::isConnected()) {
    BLEManager::handleConnection();
  }

  if (BLEManager::isConnected() && footSwitch.getEraseRecordingState()) {
      BLEManager::sendData(String("ERASE"));
      footSwitch.setEraseRecordingState(true);

      // Wait for "RECV:ERASE" response
      unsigned long startTime = millis();
      eraseAckReceived = false; // Reset the flag
      while (!eraseAckReceived) {
          BLEManager::handleConnection(); // Keep handling BLE events
          if (millis() - startTime > 5000) { // Timeout after 5 seconds
              Serial.println("Timeout waiting for RECV:ERASE");
              break;
          }
          delay(10); // Small delay to avoid busy-waiting
      }

      if (eraseAckReceived) {
          Serial.println("RECV:ERASE response received!");
      }
  }
}

void loop() {
  footSwitch.update();
  // Handle BLE connection state
  BLEManager::handleConnection();
  
  if(footSwitch.getEraseRecordingState()) {
    sendErase();
    footSwitch.setEraseRecordingState(false); // Reset the erase state after sending
  }

  if(footSwitch.hasStateChanged()) {
    Serial.println("Sending '" +  footSwitch.getStateName(footSwitch.getCurrentState()) + "' via bluetooth");
    // Send foot switch sate data if device is connected
    if (BLEManager::isConnected()) {
      String tempStr = footSwitch.getStateName(footSwitch.getCurrentState());
      BLEManager::sendData(tempStr);
    }    
  }
  delay(100);
}