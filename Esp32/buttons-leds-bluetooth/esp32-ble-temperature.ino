// ========================================
// File: esp32-ble-temperature.ino (main Arduino file)
// ========================================
//#include "BLEManager.h"
#include "FootSwitch.h"

FootSwitch footSwitch;
  
void setup() {
  Serial.begin(115200);
  
  // Initialize BLE Manager
  //BLEManager::init("ESP32");
  footSwitch.init();
}

void loop() {
  footSwitch.update();
  // Handle BLE connection state
  // BLEManager::handleConnection();
  
  // // Send temperature data if device is connected
  // if (BLEManager::isConnected()) {
  //   float temp = BLEManager::getTemperature();
  //   String tempStr = String(temp);
  //   BLEManager::sendData(tempStr);
  // }
  
  if(footSwitch.hasStateChanged()) {
    Serial.println("Sending '" +  footSwitch.getStateName(footSwitch.getCurrentState()) + "' via bluetooth");
  }
  // delay(100);
}