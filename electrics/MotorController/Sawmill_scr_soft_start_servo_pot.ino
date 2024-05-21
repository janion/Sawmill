// Libraries //

// Servo
// By Michael Margolis
#include <Servo.h>
// Tachometer moving average
// By Jack Christensen
#include <movingAvg.h>
// 7 segment display
// By AKJ
#include <TM1637.h>
// Ramp
// By Sylvain Garnavault
#include <Ramp.h>

// Pin definitions //
// Basic inputs and outputs
const int DEBUG_SWITCH_PIN = 2;
const int SWITCH_PIN = 6;
const int POT_PIN = A0;
const int TACH_PIN = 3;
const int LED_PIN = 13;
const int RELAY_PIN = 5;
const int SERVO_PIN = 11;

// Screens
const int SPEED_CLK_PIN = A2;
const int SPEED_DIO_PIN = A3;
const int POWER_CLK_PIN = 4;
const int POWER_DIO_PIN = 7;

// Operational constants //
// Debug LED flashes
const int DEBUG_NON_ZERO_INITIALISATION_FREQUENCY = 2;
const int DEBUG_NON_ZERO_SIGNAL_FREQUENCY = 5;

// servo values
const int MIN_SERVO_VAL = (int) (180 * 0.65);
const int MAX_SERVO_VAL = (int) (180 * 1.0);

// Ramp values
const long FULL_RAMP_MS = 15 * 1000;
const long RAMP_POLL_MS = 100;

// Input potentiometer
const int POT_RESOLUTION = 16;

// Screen values
const double RPM_TO_SPEED_FACTOR = 1;
const int SCREEN_POLL_MS = 200;

// Tach values
const int TACH_DEBOUNCE_TIME_MILLIS = 50;
const int TACH_EXPIRY_TIME_MILLIS = 2000;

// Controller objects //
Servo motorServo;

rampInt motorRamp(0);

TM1637 speedDisplay(SPEED_CLK_PIN, SPEED_DIO_PIN);
TM1637 powerDisplay(POWER_CLK_PIN, POWER_DIO_PIN);

movingAvg tachometer(5);

// Global variables
long lastTachTime = 0;
long thisTachTime = 0;
bool debug = false;

void setup() {
  pinMode(DEBUG_SWITCH_PIN, INPUT_PULLUP);
  debug = digitalRead(DEBUG_SWITCH_PIN) == LOW;
  
  pinMode(SWITCH_PIN, INPUT_PULLUP);
  pinMode(POT_PIN, INPUT);
  pinMode(TACH_PIN, INPUT_PULLUP);
  pinMode(LED_PIN, OUTPUT);
  pinMode(RELAY_PIN, OUTPUT);

  digitalWrite(RELAY_PIN, HIGH);
  
  if (debug) {
    Serial.begin(9600);
    Serial.println("Starting initialisation");
  }

  motorServo.attach(SERVO_PIN);
  motorServo.write(MIN_SERVO_VAL);

  // Initialise displays to maximum brightness
  speedDisplay.begin();
  speedDisplay.setBrightness(debug ? 1 : 7);
  speedDisplay.offMode();
  powerDisplay.begin();
  powerDisplay.setBrightness(debug ? 1 : 7);
  powerDisplay.offMode();

  // Initialise moving average for tachometer
  tachometer.begin();
  
  // Initialise tachometer interrupt
  attachInterrupt(digitalPinToInterrupt(TACH_PIN), tachRising, FALLING);

  // Wait for switch to be returned to off position
  awaitReset();
  
  if (debug) {
    Serial.println("Ready");
  }
}

void loop() {
  static int motorValue;
  static float motorProportion;

  motorValue = motorRamp.update();
  motorProportion = map(motorValue, 0, 1023, 0, 1000) / 1000.0;
  setMotorSpeed(motorProportion);

  if (digitalRead(SWITCH_PIN) == LOW) {
    // Flash status LED @ 2Hz if speed no-zero
    if (motorValue != 0 && millis() % (1000 / DEBUG_NON_ZERO_SIGNAL_FREQUENCY) < 100) {
      digitalWrite(LED_PIN, HIGH);
    } else {
      digitalWrite(LED_PIN, LOW);
    }
  } else {
    digitalWrite(LED_PIN, LOW);
  }

  long currentTime = millis();

  // Print tachnometer speed to the screen and serial port
  static long lastTachPollTime = 0;
  if (currentTime - lastTachPollTime >= SCREEN_POLL_MS) {
    pollTachometer(currentTime, motorProportion);
    lastTachPollTime = currentTime;
  }
  
  static long lastRampPollTime = 0;
  if (currentTime - lastRampPollTime >= RAMP_POLL_MS) {
    pollMotorRamp();
    lastRampPollTime = currentTime;
  }
}

void awaitReset() {
  // While waiting for swtich to return to off position, flash screens and LED
  if (digitalRead(SWITCH_PIN) == LOW) {
    if (debug) {
      Serial.println("Awaiting switch to be returned to off position");
    }
    
    speedDisplay.display("----");
    powerDisplay.display("----");

    // Flash status LED @ 1Hz until pot returned to zero
    while (digitalRead(SWITCH_PIN) == LOW) {
      if (millis() % (1000 / DEBUG_NON_ZERO_INITIALISATION_FREQUENCY) < 1000 / (DEBUG_NON_ZERO_INITIALISATION_FREQUENCY * 2)) {
        digitalWrite(LED_PIN, HIGH);
        speedDisplay.onMode();
        powerDisplay.onMode();
      } else {
        digitalWrite(LED_PIN, LOW);
        speedDisplay.offMode();
        powerDisplay.offMode();
      }
    }
  }
  // Turn status LED off
  digitalWrite(LED_PIN, LOW);
  speedDisplay.onMode();
  powerDisplay.onMode();
}

void tachRising() {
  if (millis() - thisTachTime > TACH_DEBOUNCE_TIME_MILLIS) {
    lastTachTime = thisTachTime;
    thisTachTime = millis();

    if (lastTachTime != 0) {
      tachometer.reading(thisTachTime - lastTachTime);
    }
  }
}

void setMotorSpeed(float proportion) {
  static int lastMotorServoValue = -1;
  int motorServoValue = map(proportion * 1000, 0, 1000, MIN_SERVO_VAL, MAX_SERVO_VAL);

  motorServo.write(motorServoValue);

  // Disable motor when value set to zero
  if (proportion > 0) {
    digitalWrite(RELAY_PIN, LOW);
  } else {
    digitalWrite(RELAY_PIN, HIGH);
  }
}

void pollTachometer(long currentTime, float motorProportion) {
  double rpm;
  if (currentTime - lastTachTime > TACH_EXPIRY_TIME_MILLIS || lastTachTime == 0 || thisTachTime == lastTachTime) {
    rpm = 0;
  } else {
    rpm = 60000.0 / tachometer.getAvg();
  }
  double tachSpeed = rpm * RPM_TO_SPEED_FACTOR;

  String speedStr = "";
  speedStr += (int) tachSpeed;
  String speedString = padString(speedStr);
  
  String powerStr = "";
  powerStr += (int) (100 * motorProportion);
  String powerString;
  if (motorProportion == 0) {
    powerString = " OFF";
  } else {
    powerString = padString(powerStr);
  }
  
  speedDisplay.display(speedString);
  powerDisplay.display(powerString);

  if (debug) {
    String output = "Motor Value: ";
    output += powerString;
    output += " - Tachometer Speed: ";
    output += speedString;
    Serial.println(output);
  }
}

String padString(String toPad) {
  if (toPad.length() == 1) {
    return("   " + toPad);
  } else if (toPad.length() == 2) {
    return("  " + toPad);
  } else if (toPad.length() == 3) {
    return(" " + toPad);
  }
  return(toPad);
}

void pollMotorRamp() {
  int pot_in;
  if (digitalRead(SWITCH_PIN) == HIGH) {
    pot_in = 0;
  } else {
    pot_in = (int) ((analogRead(POT_PIN) / POT_RESOLUTION) * POT_RESOLUTION);
  }

  if (1023 - pot_in <= POT_RESOLUTION) {
    pot_in = 1023;
  }

  int difference = pot_in - motorRamp.getValue();
  long time = abs(FULL_RAMP_MS * difference) / 1024;
  motorRamp.go(pot_in, time);
}