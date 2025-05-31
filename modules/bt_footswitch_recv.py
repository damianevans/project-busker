#!/usr/bin/env python3
"""
Raspberry Pi BLE Client to connect to ESP32 and receive looper data
Requires: pip install bleak asyncio-mqtt (optional for MQTT publishing)
"""

import asyncio
import logging
import string
from bleak import BleakClient, BleakScanner
from bleak.backends.characteristic import BleakGATTCharacteristic
import time
from datetime import datetime

# Nordic UART Service UUIDs (same as ESP32)
UART_SERVICE_UUID = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"
UART_TX_CHAR_UUID = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"  # ESP32 RX (we write to this)
UART_RX_CHAR_UUID = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"  # ESP32 TX (we read from this)

class ESP32BLEClient:
    def __init__(self, device_name="ESP32"):
        self.device_name = device_name
        self.client = None
        self.device = None
        self.connected = False
        self.looperstate_data = []
        
    async def scan_for_device(self, timeout=10.0):
        """Scan for the ESP32 device"""
        print(f"Scanning for {self.device_name}...")
        
        devices = await BleakScanner.discover(timeout=timeout)
        
        for device in devices:
            if device.name and self.device_name.lower() in device.name.lower():
                print(f"Found device: {device.name} - {device.address}")
                self.device = device
                return device
                
        print(f"Device {self.device_name} not found")
        return None
    
    async def connect(self):
        """Connect to the ESP32 device"""
        if not self.device:
            await self.scan_for_device()
            
        if not self.device:
            return False
            
        try:
            self.client = BleakClient(self.device.address)
            await self.client.connect()
            self.connected = True
            print(f"Connected to {self.device.name}")
            
            # Subscribe to notifications from ESP32 TX characteristic
            await self.client.start_notify(UART_RX_CHAR_UUID, self.notification_handler)
            print("Subscribed to notifications")
            
            return True
            
        except Exception as e:
            print(f"Failed to connect: {e}")
            return False
    
    async def disconnect(self):
        """Disconnect from the ESP32 device"""
        if self.client and self.connected:
            try:
                await self.client.stop_notify(UART_RX_CHAR_UUID)
                await self.client.disconnect()
                self.connected = False
                print("Disconnected from ESP32")
            except Exception as e:
                print(f"Error during disconnect: {e}")
    
    async def send_message(self, message):
        """Send a message to the ESP32"""
        if self.client and self.connected:
            try:
                message_bytes = message.encode('utf-8')
                await self.client.write_gatt_char(UART_TX_CHAR_UUID, message_bytes)
                print(f"Sent: {message}")
            except Exception as e:
                print(f"Failed to send message: {e}")
    
    def notification_handler(self, characteristic: BleakGATTCharacteristic, data: bytearray):
        """Handle incoming notifications (looper data)"""
        try:
            message = data.decode('utf-8').strip()
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            
            # Try to parse as looper value
            try:
                temp_value = str(message).strip().upper()
                print(f"[{timestamp}] received looper state: {temp_value}")
                
                # Store looper data
                self.looperstate_data.append({'looper': temp_value})
                
                # Keep only last 10 readings
                if len(self.looperstate_data) > 10:
                    self.looperstate_data.pop(0)
                    
            except ValueError:
                # Not a looper value, just print the message
                print(f"[{timestamp}] Received: {message}")
                
        except Exception as e:
            print(f"Error handling notification: {e}")
    
    def get_latest_looperstate(self):
        """Get the most recent looper reading"""
        if self.looperstate_data:
            return str(self.looperstate_data[-1].get('looper', None)).capitalize()
        return ""
    

    
