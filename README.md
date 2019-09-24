# electric-stimulator
code for an electric stimulator using BIOPAC system


## project documentation:
- this project is documented using [Hardocs](https://gitlab.com/go-commons/hardocs)
- details on how to run the code can be found in:


## setting up system:

---
#### for testing, we will only use the Arduino IDE to send commands to the board and get the stimuli going.

~~1. install miniconda (Python3): https://docs.conda.io/en/latest/miniconda.html~~

 ~~1.1. Using the commandline (conda command line for windows users), create a new environment: "conda create --name electric"~~

 ~~1.2. activate the environment: "conda activate electric"~~

 ~~1.3. install the necessary libraries: Serial, numpy, time:~~
 ~~- conda install pyserial spyder numpy~~

---

2. Install Arduino IDE and its drivers: https://www.arduino.cc/en/Main/Software
3. Install the arduino DUE support (SAM boards) using the board manager tool in the IDE (tools > boards > boards_manager)

4. Download and unzip the serial communication library (https://github.com/kroimon/Arduino-SerialCommand). Place the unzipped folder on the Arduino Libraries folder.

5. test that everything is working by opening the serial communication library example code and uploading it to the board.
 - Emit a couple of commands (eg: ON, OFF, HELLO) using the serial monitor (can be accessed via the icon on the top right corner of the Arduino IDE).

6. Upload the "SerialCommands" sketch to the arduino board and open the Serial monitor
 - DUR ZZZ sets the duration in milliseconds (where ZZZ is the desired time)
 - AMP YYY sets the voltage level, in between 0.55 and 2.75.
 - GO starts the stimulation.



~~5. run spyder~~

~~6. open update.py~~

~~7. use it to change stimulus duration, amplitude, etc.~~

### Hardware considerations:

- The BIOPAC system takes voltage signals as inputs to create the electric stimulus. Here we are using an Arduino DUE as the system needs a true analog voltage and not PWM.
 - The arduno DUE has two DAC ports that output signals in between 0.55 and 2.75V with 12bit resolution (in other words, we can divide the 2.75-0.55 interval into 4096 discrete levels).
 - One limitation is that there is no true 0V for the ports, so we need to use a NPN transistor to interrupt the circuit and realy turn off the system.
 - The diagram can be seen in folder /hardware in this Repository
