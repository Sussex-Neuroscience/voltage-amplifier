// Code to set and start electrical stimulation using an Arduino DUE and BIOPAC system
// CC BY SA 4.0 20190924
// Chagas AM.
// Based on Demo Code for SerialCommand Library by Steven Cogswell May 2011

#include <SerialCommand.h>

#define arduinoLED 13   // Arduino LED on board

// channel 1
int transistorPort1 = 6;
long int stimDur1 = 0;
float stimAmp1 = 0.55;
int mappedOut1 = 0;
int numRep1 = 1;
int DACport1 = DAC0;

// channel 2
int transistorPort2 = 5;
long int stimDur2 = 0;
float stimAmp2 = 0.55;
int mappedOut2 = 0;
int numRep2 = 1;
int DACport2 = DAC1;

SerialCommand sCmd;     // The demo SerialCommand object

void setup() {
  pinMode(arduinoLED, OUTPUT);      // Configure the onboard LED for output
  pinMode(transistorPort1,OUTPUT); // configure transistor port
  pinMode(transistorPort2,OUTPUT); // configure transistor port
  pinMode (DACport1,OUTPUT);
  pinMode (DACport2,OUTPUT);
  digitalWrite(arduinoLED, LOW);    // default to LED off
  analogWriteResolution(12);         // set the resolution to 12, since we are using the DAC ports

  Serial.begin(9600);

  // Setup callbacks for SerialCommand commands
  sCmd.addCommand("ON",    LED_on);          // Turns LED on
  sCmd.addCommand("OFF",   LED_off);         // Turns LED off
  
  sCmd.addCommand("DUR1",   duration1);        // stimulus duration (milliseconds) channel 1
  sCmd.addCommand("AMP1",   amplitude1);       // stimulus amplitude (volts) channel 1
  sCmd.addCommand("REP1",   repetitions1);       // nuber of trains channel 1 
  sCmd.addCommand("GO1",    stim_on1);         // Start stimulation channel 1
  sCmd.addCommand("DUR2",   duration2);        // stimulus duration (milliseconds) channel 2
  sCmd.addCommand("AMP2",   amplitude2);       // stimulus amplitude (volts) channel 2
  sCmd.addCommand("REP2",   repetitions2);       // nuber of trains channel 2
  sCmd.addCommand("GO2",    stim_on2);         // Start stimulation channel 2
  
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

void stim_on1() {
  Serial.println("Stimulus settings channel 1:");
  Serial.print("Duration "); Serial.print(stimDur1); Serial.println(" milliseconds");
  Serial.print("Analog output "); Serial.print(stimAmp1); Serial.println(" Volts");
  Serial.print("number of trains "); Serial.println(numRep1);
  Serial.println("stim on");



  // we need to map the voltage level to integer in between 0 and 4096)but map function only takes integers,
  // so we make sure our floats are integers (analog output has a range between 0.55 to 2.75, we multiply that
  // by 100 as well as the stimAmp value)
  mappedOut1 = map(int(stimAmp1*100), 55, 275, 0, 4095);

  for (int i=0; i <= numRep1; i++){
    digitalWrite(arduinoLED, HIGH);
    digitalWrite(transistorPort1, HIGH);
    //Serial.println(mappedOut1);
    analogWrite(DACport1,mappedOut1);
    delay(stimDur1);
    analogWrite(DACport1,0);
    digitalWrite(arduinoLED, LOW);
    digitalWrite(transistorPort1, LOW);
    delay(stimDur1);
  }// end for
  Serial.println("stim off");

}

void stim_on2() {
  Serial.println("Stimulus settings channel 2:");
  Serial.print("Duration "); Serial.print(stimDur2); Serial.println(" milliseconds");
  Serial.print("Analog output "); Serial.print(stimAmp2); Serial.println(" Volts");
  Serial.print("number of trains "); Serial.println(numRep2);
  Serial.println("stim on");



  // we need to map the voltage level to integer in between 0 and 4096)but map function only takes integers,
  // so we make sure our floats are integers (analog output has a range between 0.55 to 2.75, we multiply that
  // by 100 as well as the stimAmp value)
  mappedOut2 = map(int(stimAmp2*100), 55, 275, 0, 4095);

  for (int i=0; i <= numRep2; i++){
    digitalWrite(arduinoLED, HIGH);
    digitalWrite(transistorPort2, HIGH);
    analogWrite(DACport2,mappedOut2);
    delay(stimDur2);
    analogWrite(DACport2,0);
    digitalWrite(arduinoLED, LOW);
    digitalWrite(transistorPort2, LOW);
    delay(stimDur2);
  }// end for
  Serial.println("stim off");

}

void repetitions1() {
  char *arg;
  int aNumber;

  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("number of trains channel 1: ");
    Serial.print(arg);

    aNumber = atoi(arg);    // Converts a char string to an integer
    numRep1 = aNumber;
  }
  else {
    Serial.println("repetitions = 0!, defaulting it to 1!");
    numRep1 = 1;
  }
}

void repetitions2() {
  char *arg;
  int aNumber;

  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("number of trains channel 2: ");
    Serial.print(arg);

    aNumber = atoi(arg);    // Converts a char string to an integer
    numRep2 = aNumber;
  }
  else {
    Serial.println("repetitions = 0!, defaulting it to 1!");
    numRep2 = 1;
  }
}

void duration1() {
  char *arg;
  long int aNumber;

  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("stim duration channel 1 ");
    Serial.print(arg);
    Serial.println(" milliseconds");
    aNumber = atoi(arg);    // Converts a char string to an integer
    stimDur1 = aNumber;
  }
  else {
    Serial.println("no duration given!, defaulting it to zero!");
    stimDur1 = 0;
  }
}

void duration2() {
  char *arg;
  long int aNumber;

  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("stim duration channel 2 ");
    Serial.print(arg);
    Serial.println(" milliseconds");
    aNumber = atoi(arg);    // Converts a char string to an integer
    stimDur2 = aNumber;
  }
  else {
    Serial.println("no duration given!, defaulting it to zero!");
    stimDur2 = 0;
  }
}

void amplitude1() {
  char *arg;
  float aNumber;

  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("stim amplitude channel 1");
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

    stimAmp1 = aNumber;
  }
  else {
    Serial.println("no amplitude given!, defaulting it to zero!");
    stimAmp1 = 0;
  }
}

void amplitude2() {
  char *arg;
  float aNumber;

  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("stim amplitude channel 2");
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

    stimAmp2 = aNumber;
  }
  else {
    Serial.println("no amplitude given!, defaulting it to zero!");
    stimAmp2 = 0;
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
