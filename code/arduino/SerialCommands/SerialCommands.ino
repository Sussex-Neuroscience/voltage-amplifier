// Code to set and start electrical stimulation using an Arduino DUE and BIOPAC system
// CC BY SA 4.0 20190924 
// Chagas AM.
// Based on Demo Code for SerialCommand Library by Steven Cogswell May 2011

#include <SerialCommand.h>

#define arduinoLED 13   // Arduino LED on board

long int stimDur = 0;
float stimAmp = 0.55;
int mappedOut = 0;

SerialCommand sCmd;     // The demo SerialCommand object

void setup() {
  pinMode(arduinoLED, OUTPUT);      // Configure the onboard LED for output
  pinMode (DAC1,OUTPUT);
  digitalWrite(arduinoLED, LOW);    // default to LED off
  analogWriteResolution(12);         // set the resolution to 12, since we are using the DAC ports

  Serial.begin(9600);

  // Setup callbacks for SerialCommand commands
  sCmd.addCommand("ON",    LED_on);          // Turns LED on
  sCmd.addCommand("OFF",   LED_off);         // Turns LED off
  sCmd.addCommand("DUR",   duration);        // stimulus duration
  sCmd.addCommand("AMP",   amplitude);       // stimulus amplitude
  sCmd.addCommand("GO",    stim_on);         // Start stimulation
  sCmd.addCommand("HELLO", sayHello);        // Echos the string argument back
  sCmd.addCommand("P",     processCommand);  // Converts two arguments to integers and echos them back
  sCmd.setDefaultHandler(unrecognized);      // Handler for command that isn't matched  (says "What?")
  Serial.println("Ready");
}

void loop() {
  sCmd.readSerial();     // We don't do much, just process serial commands
}


void LED_on() {
  Serial.println("LED on");
  digitalWrite(arduinoLED, HIGH);
}

void LED_off() {
  Serial.println("LED off");
  digitalWrite(arduinoLED, LOW);
}

void stim_on() {
  Serial.println("Stimulus settings:");
  Serial.print("Duration "); Serial.print(stimDur); Serial.println(" milliseconds");
  Serial.print("Analog output "); Serial.print(stimAmp); Serial.println(" Volts");
  Serial.println("stim on");
  
  digitalWrite(arduinoLED, HIGH);
  // we need to map the voltage level to integer in between 0 and 4096)but map function only takes integers,
  // so we make sure our floats are integers (analog output has a range between 0.55 to 2.75, we multiply that
  // by 100 as well as the stimAmp value)
  mappedOut = map(int(stimAmp*100), 55, 275, 0, 4095);
  analogWrite(DAC1,mappedOut);
  delay(stimDur);
  analogWrite(DAC1,0);
  digitalWrite(arduinoLED, LOW);
  
  Serial.println("stim off");
  
}

void sayHello() {
  char *arg;
  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("Hello ");
    Serial.println(arg);
  }
  else {
    Serial.println("Hello, whoever you are");
  }
}

void duration() {
  char *arg;
  long int aNumber;
 
  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("stim duration ");
    Serial.print(arg);
    Serial.println(" milliseconds");
    aNumber = atoi(arg);    // Converts a char string to an integer
    stimDur = aNumber;
  }
  else {
    Serial.println("no duration given!, defaulting it to zero!");
    stimDur = 0;
  }
}

void amplitude() {
  char *arg;
  float aNumber;
 
  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("stim amplitude ");
    Serial.println(arg);
    aNumber = atof(arg);    // Converts a char string to an float
    if (aNumber<0.55){
      Serial.println("defaulting to minimum amplitude 0.55");
      aNumber = 0.55;
      }//if number smaller than 0.55

    if (aNumber>2.75){
      Serial.println("defaulting to maximum amplitude 2.75");
      aNumber = 2.75;
      }//if number bigger than 2.75
      
    stimAmp = aNumber;
  }
  else {
    Serial.println("no amplitude given!, defaulting it to zero!");
    stimAmp = 0;
  }
}

void processCommand() {
  int aNumber;
  char *arg;

  Serial.println("We're in processCommand");
  arg = sCmd.next();
  if (arg != NULL) {
    aNumber = atoi(arg);    // Converts a char string to an integer
    Serial.print("First argument was: ");
    Serial.println(aNumber);
  }
  else {
    Serial.println("No arguments");
  }

  arg = sCmd.next();
  if (arg != NULL) {
    aNumber = atol(arg);
    Serial.print("Second argument was: ");
    Serial.println(aNumber);
  }
  else {
    Serial.println("No second argument");
  }
}

// This gets set as the default handler, and gets called when no other command matches.
void unrecognized(const char *command) {
  Serial.println("What?");
}
