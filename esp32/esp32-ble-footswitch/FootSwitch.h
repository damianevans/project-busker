#ifndef FOOTSWITCH_H
#define FOOTSWITCH_H

#include <Arduino.h>
#include <PinButton.h>

class FootSwitch {
public:
    // Define states using an enum
    enum State {
        IDLE,
        RECORDING,
        PLAYBACK,
        STOPPED
    };

    // Constructor
    FootSwitch();
    
    // Initialize the footswitch system
    void init();
    
    // Update the footswitch state (call in loop)
    void update();
    
    // Get current state
    State getCurrentState() const;
    
    // Get state name as string
    String getStateName(State state) const;

    bool hasStateChanged() const;

    bool getEraseRecordingState() const;

    void setEraseRecordingState(bool state);

private:
    // Pin definitions
    static const int footSwitch1Pin = 5;   // Footswitch 1: Record/Stop Rec & Play
    static const int footSwitch2Pin = 17;  // Footswitch 2: Play/Stop
    static const int redLEDPin = 2;        // Red LED
    static const int greenLEDPin = 4;      // Green LED

    
    // Timing variables
    unsigned long lastFlashTime;
    static const unsigned long flashInterval = 500; // Flash every 500ms
    bool greenLedState;
    
    // Button objects
    PinButton footSwitch1;
    PinButton footSwitch2;
    
    // State variables
    State currentState;
    State previousState;
    bool eraseRecordingState;
    
    // State names array
    static const String status[4];
    
    // Private methods
    void updateLEDs();
    void handleStateTransitions();
    void performStartupSequence();
};

#endif // FOOTSWITCH_H