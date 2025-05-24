// ========================================
// File: BLECallbacks.h
// ========================================
#ifndef BLE_CALLBACKS_H
#define BLE_CALLBACKS_H

#include <BLEDevice.h>
#include <BLEServer.h>

// Forward declarations
extern bool deviceConnected;
extern const int LED_PIN;

class MyServerCallbacks: public BLEServerCallbacks {
  public:
    void onConnect(BLEServer* pServer);
    void onDisconnect(BLEServer* pServer);
};

class MyCharacteristicCallbacks: public BLECharacteristicCallbacks {
  public:
    void onWrite(BLECharacteristic *pCharacteristic);
};

#endif