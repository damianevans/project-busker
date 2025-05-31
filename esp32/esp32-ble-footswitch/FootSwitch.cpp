#include "FootSwitch.h"

// Initialize static member
const String FootSwitch::status[4] = {"IDLE", "RECORDING", "PLAYBACK", "STOPPED"};

FootSwitch::FootSwitch() 
    : footSwitch1(footSwitch1Pin), 
      footSwitch2(footSwitch2Pin),
      currentState(IDLE),
      previousState(IDLE),
      lastFlashTime(0),
      greenLedState(false),
      eraseRecordingState(false) {
}

void FootSwitch::init() {
    Serial.begin(115200); 
    Serial.println("Starting up. currentState = " + status[(int)currentState]);
    
    // Configure LED pins
    pinMode(redLEDPin, OUTPUT);
    pinMode(greenLEDPin, OUTPUT);
    pinMode(bluePin, OUTPUT);
    digitalWrite(bluePin, LOW); 
    digitalWrite(redLEDPin, LOW);
    digitalWrite(greenLEDPin, LOW);
    
    // Perform startup sequence
    performStartupSequence();
}

void FootSwitch::performStartupSequence() {
    // Startup routine
    digitalWrite(redLEDPin, HIGH);
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(bluePin, LOW); 
    delay(800);
    
    digitalWrite(redLEDPin, LOW);
    digitalWrite(greenLEDPin, HIGH);
    digitalWrite(bluePin, LOW); 
    delay(800);
    
    digitalWrite(redLEDPin, LOW);
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(bluePin, HIGH); 
    delay(800);
    
    digitalWrite(redLEDPin, LOW);
    digitalWrite(greenLEDPin, HIGH);
    digitalWrite(bluePin, LOW); 
    delay(800);

    digitalWrite(redLEDPin, HIGH);
    digitalWrite(greenLEDPin, LOW);
    digitalWrite(bluePin, LOW); 
}

void FootSwitch::update() {
    // Update the state of the footSwitches
    footSwitch1.update();
    footSwitch2.update();
    
    previousState = currentState;
    
    handleStateTransitions();
    updateLEDs();
    
    // Print state changes
    if(hasStateChanged()) {
        Serial.println("State change - Was: " + status[(int)previousState] + 
                      ", Now: " + status[(int)currentState]);
    }
}

void FootSwitch::handleStateTransitions() {
    switch (currentState) {
        case IDLE:
            // Press Footswitch 1 to start recording
            if (footSwitch1.isClick()) {
                currentState = RECORDING;
            }
            break;
            
        case RECORDING:
            // Press Footswitch 1 to play the loop
            if (footSwitch1.isClick()) {
                currentState = PLAYBACK;
            }
            // Press Footswitch 2 to stop recording
            else if (footSwitch2.isClick()) {
                currentState = STOPPED;
            }
            break;
            
        case PLAYBACK:
            // Press Footswitch 2 to stop playback
            if (footSwitch2.isClick()) {
                currentState = STOPPED;
            }
            break;
            
        case STOPPED:
            // Press Footswitch 2 to play the loop
            if (footSwitch2.isClick()) {
                currentState = PLAYBACK;
            }
            // Hold Footswitch 1 to clear the loop and return to Idle
            else if (footSwitch1.isLongClick()) {
                Serial.println("Erasing recording");
                for(int cnt = 0; cnt < 3; cnt++) {
                    digitalWrite(redLEDPin, HIGH);
                    delay(flashInterval - 150);
                    digitalWrite(redLEDPin, LOW);
                    delay(flashInterval - 150);
                }
                setEraseRecordingState(true);
                currentState = IDLE;
            }
            break;
    }
}

void FootSwitch::updateLEDs() {
    switch (currentState) {
        case IDLE:
            // Both LEDs off
            digitalWrite(redLEDPin, LOW);
            digitalWrite(greenLEDPin, LOW);
            break;
            
        case RECORDING:
            // Red LED on, Green LED off
            digitalWrite(redLEDPin, HIGH);
            digitalWrite(greenLEDPin, LOW);
            break;
            
        case PLAYBACK:
            // Red LED off, Green LED on
            digitalWrite(redLEDPin, LOW);
            digitalWrite(greenLEDPin, HIGH);
            break;
            
        case STOPPED:
            // Red LED off, Green LED flashing
            digitalWrite(redLEDPin, LOW);
            if (millis() - lastFlashTime >= flashInterval) {
                lastFlashTime = millis();
                greenLedState = !greenLedState;
                digitalWrite(greenLEDPin, greenLedState ? HIGH : LOW);
            }
            break;
    }
}

FootSwitch::State FootSwitch::getCurrentState() const {
    return currentState;
}

String FootSwitch::getStateName(State state) const {
    return status[(int)state];
}

bool FootSwitch::hasStateChanged() const {
    return currentState != previousState;
}

bool FootSwitch::getEraseRecordingState() const {
  return eraseRecordingState;
}

void FootSwitch::setEraseRecordingState(bool state) {
  eraseRecordingState = state;
}