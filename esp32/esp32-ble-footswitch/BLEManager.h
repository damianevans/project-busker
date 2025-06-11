// ========================================
// File: BLEManager.h
// ========================================
#ifndef BLE_MANAGER_H
#define BLE_MANAGER_H

#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>

class BLEManager {
  private:
    static BLEServer* pServer;
    static BLECharacteristic* pTxCharacteristic;
    static bool oldDeviceConnected;
    
    static const char* SERVICE_UUID;
    static const char* CHARACTERISTIC_UUID_RX;
    static const char* CHARACTERISTIC_UUID_TX;

  public:
    static void init(const char* deviceName);
    static void handleConnection();
    static void sendData(const String& data);
    static bool isConnected();
    static void onDataReceived(const std::string& value);
};

// Global variables (accessible by callbacks)
extern bool deviceConnected;
extern const int LED_PIN;

#endif
