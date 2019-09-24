import numpy


#try to import the serial library
try:
    import serial
    serialAvail = True
    print ("serial lib loaded.")

except ImportError:
    serialAvail = False
    print ("serial module not available!")

class Main():

    loadSerial = 1
    if loadSerial == 1:
        self.ser = serial.Serial('/dev/ttyUSB0', 115200)
        if self.ser.in_waiting != 0:
            print(self.ser.readline())

    def output1(self,command = "TW 1"):
        if loadSerial == 1:
            self.ser.write(str(command+' \n').encode('utf-8'))
            #self.ser.flush()
        else:
            print("serial not loaded")

    def runCommands(self,allcom=['P0','R0','L1 0','L2 0','S0']):
        x=1
        for command in allcom:
            haltFlag=1

            #self.output1(command=command)

            self.ser.write(str(command+'\n').encode('utf-8'))
            self.ser.flush()
            x=x+1
            while self.ser.in_waiting==0:
                x=x
            while haltFlag==1:
                test=self.ser.readline()
                #print(test[0:-2])
                if test[0:-2]=='d'.encode('utf-8') or test[0:-2]=='Ready'.encode('utf-8'):
                    haltFlag=0
                else:
                    print(test)
                    print("ops")
