#include <PinButton.h>

// Define pins for footSwitches and LEDs
const int footSwitch1Pin = 5; // Footswitch 1: Record/Stop Rec & Play
const int footSwitch2Pin = 17; // Footswitch 2: Play/Stop
const int redLEDPin = 2;      // Red LED
const int greenLEDPin = 4;    // Green LED
// Variables for flashing the green LED in STOPPED state
unsigned long lastFlashTime = 0;
const unsigned long flashInterval = 500; // Flash every 500ms
bool greenLedState = false;

PinButton footSwitch1(footSwitch1Pin);
PinButton footSwitch2(footSwitch2Pin);


// Define states using an enum
enum State {
  IDLE,
  RECORDING,
  PLAYBACK,
  STOPPED
};

const String status[] = { "IDLE",
                          "RECORDING",
                          "PLAYBACK",
                          "STOPPED"};

// Variable to track the current state, starting at IDLE
State currentState = IDLE;

void setup() {
  Serial.begin(115200); 
  Serial.println("Starting up. currentState = " + status[(int)currentState]);
  pinMode(redLEDPin, OUTPUT);
  pinMode(greenLEDPin, OUTPUT);
  digitalWrite(redLEDPin, LOW);
  digitalWrite(greenLEDPin, LOW);
  //do a little startup routine ;-)
  digitalWrite(redLEDPin, HIGH);
  digitalWrite(greenLEDPin, LOW);
  delay(800);
  digitalWrite(redLEDPin, HIGH);
  digitalWrite(greenLEDPin, HIGH);
  delay(800);
    digitalWrite(redLEDPin, LOW);
  digitalWrite(greenLEDPin, HIGH);
  delay(800);
  digitalWrite(redLEDPin, LOW);
  digitalWrite(greenLEDPin, LOW);
}

void updateLEDs() {
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

void loop() {
  // Update the state of the footSwitches
  footSwitch1.update();
  footSwitch2.update();
  State previousState = currentState;
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
      // // Press Footswitch 1 to overdub
      // if (footSwitch1.isClick()) {
      //   currentState = OVERDUB;
      // }
      // // Press Footswitch 2 to stop playback
      // else 
      if (footSwitch2.isClick()) {
        currentState = STOPPED;
      }
      break;      

    case STOPPED:
      // Press Footswitch 2 to play the loop
      if (footSwitch2.isClick()) {
        currentState = PLAYBACK;
      }
      // Hold Footswitch 2 to clear the loop and return to Idle
      else if (footSwitch1.isLongClick()) {
        Serial.println("Erasing recording");
        for(int cnt = 0; cnt < 3; cnt++) {
          digitalWrite(redLEDPin, HIGH);
          delay(flashInterval-150);
          digitalWrite(redLEDPin, LOW);
          delay(flashInterval-150);
        }
        currentState = IDLE;
      }
      break;
  }
  updateLEDs();
  if(previousState != currentState) {
    Serial.println("State change - Was: " + status[(int)previousState] + ", Now: " + status[(int)currentState]);
  }
}
