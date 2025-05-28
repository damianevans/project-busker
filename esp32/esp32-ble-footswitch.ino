// ========================================
// File: esp32-ble-temperature.ino (main Arduino file)
// ========================================
#include "BLEManager.h"
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

  if (BLEManager::isConnected() && footSwitch.getEraseRecordingState() ) {
    BLEManager::sendData(String("ERASE"));
    footSwitch.setEraseRecordingState(true);
  }
}

void loop() {
  footSwitch.update();
  // Handle BLE connection state
  BLEManager::handleConnection();
  

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