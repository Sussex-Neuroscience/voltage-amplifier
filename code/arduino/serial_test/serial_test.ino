// FlyPi Arduino control code    //
// Dev. by AM Chagas             //
// 20190702 CC BY SA 4.0         //

// dependencies:
// Adafruit libraries for
//  - LED Matrix
//  - LED Ring
// SerialCommand Library by Steven Cogswell




// Import libraries

#include <SerialCommand.h>

// define ports
#define servoOnPin 9

//Timing Variables////////////////////////
long int millistowait;

////////////////////////////////////////

SerialCommand sCmd;     // The demo SerialCommand object

void setup() {

  Serial.begin(115200);

  // Setup callbacks for SerialCommand commands //////

  sCmd.addCommand("S1",    SERVO_on);
  sCmd.addCommand("TW",     TIME_wait);        // sets time to wait


  sCmd.addCommand("HELLO", sayHello);        // Echos the string argument back
  sCmd.addCommand("P",     processCommand);  // Converts two arguments to integers and echos them back
  sCmd.setDefaultHandler(unrecognized);      // Handler for command that isn't matched  (says "What?")


}

void loop() {

  sCmd.readSerial();     // We don't do much, just process serial commands

}// void loop


///////// servo callbacks ////////////////////////////
void SERVO_on(){
  servoOn = 1;
  int aNumber;
  char *arg;
  arg = sCmd.next();

  if (arg != NULL) {

    if (atoi(arg) == 90){
      digitalWrite(servoOnPin, LOW);
      }//end if arg==90

    else {
    digitalWrite(servoOnPin, HIGH);
    focusServo.write(atoi(arg)); //because this is a cont. servo,
    //this will set the velocity, not the pos.
    delay(15);
    }//end else
    }// if arg!=NULL
  waited();

  }//servo_on

///////////////////////////////////////
// timing functions /////////////////

void TIME_wait(){

  int aNumber;
  //int time1;
  //int time2;
  char *arg;
  long int time1=0;
  long int time2=0;

  time1 = millis();
  time2 = time1;

  arg = sCmd.next();
  if (arg != NULL) {
    aNumber = atoi(arg);
    //Serial.println(aNumber);
    //wait amount of time
    while ((time1 - time2) < aNumber) {
    time1 = millis();
     } //done waiting


  }//if
  waited();
  }//time_wait


/////////////////////////////////////////



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

void waited(){
  Serial.println("d");
  }
