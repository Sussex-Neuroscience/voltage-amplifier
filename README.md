# Arduino Due compatible voltage amplifier

Hi! This repository contains all the necessary documents to replicate an arduino Due compatible voltage amplifier.

This system was developed as part of a research project of the [Ward Lab](http://www.sussex.ac.uk/profiles/92444/research). It is to be used with a stimulus isolation adaptor from BIOPAC, more specifically one of the models that provide isolated voltage: https://www.biopac.com/product/stimulus-isolation-adapters/

The idea is simple, we use the true analog output ports from the Arduino DUE as an independent channel and amplify their signals using Operational amplifiers. In this case two [LM741](https://www.biopac.com/product/stimulus-isolation-adapters/) from Texas instruments. Using serial communication the system can be controlled in various ways, from the Arduino IDE to whatever programming languages (Python, Matlab, etc).

In [Hardware](./hardware) readers are going to find the information necessary (gerbers, bill of materials) to order components and replicate the board.



In [code](./code) readers are going to find the arduino code needed to for sending serial commands to the arduino and getting voltage signals out of the 2 different analog channels. There is also example code in Matlab to show how to control the arduino (readers should note that the Matlab Arduino libraries are not being used. Just plain serial commands).

---

## setting up system (bare minimum):



1. Install Arduino IDE and its drivers: https://www.arduino.cc/en/Main/Software
2. Install the arduino DUE support (SAM boards) using the board manager tool in the IDE (tools > boards > boards_manager)

3. Download and unzip the serial communication library (https://github.com/kroimon/Arduino-SerialCommand). Place the unzipped folder on the Arduino Libraries folder.

4. test that everything is working by opening the serial communication library example code and uploading it to the board.

  - Emit a couple of commands (eg: ON, OFF, HELLO) using the serial monitor (can be accessed via the icon on the top right corner of the Arduino IDE).


5. Upload the "SerialCommands" sketch to the arduino board and open the Serial monitor

- **channel1**  
    - DUR1 ZZZ sets the stimulus duration in milliseconds (where ZZZ should be replaced by the time desired) for channel 1.    
      - ZZZ specifies the amount of time of ON and OFF phase of the pulse (ie ZZZ=10 defines a pulse that is 10ms on and 10ms off).
    - REP1 WWW sets the number of pulses for channel 1.  
    - AMP1 YYY sets the voltage level, in between 550 and 2750 for channel 1.  
    - GO1 starts the stimulation in channel 1.  


- **channel 2**  
    - DUR2 ZZZ sets the stimulus duration in milliseconds(where ZZZ should be replaced by the time desired) for channel 2.    
      - ZZZ specifies the amount of time of ON and OFF phase of the pulse (ie ZZZ=10 defines a pulse that is 10ms on and 10ms off).    
    - REP2 WWW sets the number of pulses for channel 2.    
    - AMP2 YYY sets the voltage level, in between 550 and 2750 milliVolts for channel 2.    
    - GO2 starts the stimulation in channel 2.    

---

### Hardware considerations:

- The BIOPAC system takes voltage signals as inputs to create the electric stimulus. Here we are using an Arduino DUE as the system needs a true analog voltage and not PWM.
  - The arduno DUE has two DAC ports that output signals in between 0.55 and 2.75V with 12bit resolution (in other words, we can divide the 2.75-0.55 interval into 4096 discrete levels).
  - One limitation is that there is no true 0V for the ports, so we need to use a NPN transistor to interrupt the circuit and realy turn off the system.
  - [Here]((/hardware/transistor_switch/schematic.pdf)) is the diagram for the transistor switches

  ---

### ordering everything using [Kitspace.org](kitspace.org)

- To make it easy for readers to source all necessary components, we've uploaded this project to Kitspace, an open source project that simplifies the ordering process. Follow this link https://kitspace.org/boards/github.com/sussex-neuroscience/voltage-amplifier/ to go to the project page on Kitspace.
