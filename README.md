# electric-stimulator
code for an electric stimulator using BIOPAC system


~~## project documentation:~~
~~- this project is documented using [Hardocs](https://gitlab.com/go-commons/hardocs)~~
~~- details on how to run the code can be found in:~~


## setting up system:

---

1. Install Matlab
 - this project runs without the arduino addons for Matlab, instead we are using "simple" serial communication.

2. Install Arduino IDE and its drivers: https://www.arduino.cc/en/Main/Software
3. Install the arduino DUE support (SAM boards) using the board manager tool in the IDE (tools > boards > boards_manager)

4. Download and unzip the serial communication library (https://github.com/kroimon/Arduino-SerialCommand). Place the unzipped folder on the Arduino Libraries folder.

5. test that everything is working by opening the serial communication library example code and uploading it to the board.

  - Emit a couple of commands (eg: ON, OFF, HELLO) using the serial monitor (can be accessed via the icon on the top right corner of the Arduino IDE).


6. Upload the "SerialCommands" sketch to the arduino board and open the Serial monitor
- channel1

    - DUR1 ZZZ sets the stimulus duration in millisec (where ZZZ is the desired time) for channel 1
    - REP1 WWW sets the number of pulses for channel 1
    - AMP1 YYY sets the voltage level, in between 0.55 and 2.75. for channel 1
    - GO1 starts the stimulation in channel 1.  


  - channel 2
    - DUR2 ZZZ sets the stimulus duration in milliscec(where ZZZ is the desired time) for channel 2
    - REP2 WWW sets the number of pulses for channel 2
    - AMP2 YYY sets the voltage level, in between 0.55 and 2.75. for channel 2
    - GO2 starts the stimulation in channel 2.



~~5. run Matlab~~

~~6. change to the folder containing the functions (stim_chan1.m and stim_chan2.m)~~

~~7. call the desired function ex: stim_chan1(duration, amplitude, repetitions)~~
  ~~- the function will prompt the user to press a key to start stimulation.~~

---

### Hardware considerations:

- The BIOPAC system takes voltage signals as inputs to create the electric stimulus. Here we are using an Arduino DUE as the system needs a true analog voltage and not PWM.
  - The arduno DUE has two DAC ports that output signals in between 0.55 and 2.75V with 12bit resolution (in other words, we can divide the 2.75-0.55 interval into 4096 discrete levels).
  - One limitation is that there is no true 0V for the ports, so we need to use a NPN transistor to interrupt the circuit and realy turn off the system.
  - [Here]((/hardware/transistor_switch/schematic.pdf)) is the diagram for the transistor switches

  ---
