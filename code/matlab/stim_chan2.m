% script to run the functions to control the arduino used in the electric
% stimulator project.
% code developed by AM Chagas 07/10/2019
% CC-BY-SA 4.0


%%


function  done = stim_chan2 (duration, amplitude, repetitions)
%change the next line to the com port the arduino is connected to:
%ec: port = "COM5";
port = "/dev/ttyACM1";
x=serial(port,'BAUD', 9600);
%x.Terminator = 'CR';
fopen(x);

appDuration = duration*2*repetitions/1000;
duration = strcat("DUR2 ",int2str(duration));
amplitude = strcat("AMP2 ",int2str(amplitude));
repetitions = strcat("REP2 ",int2str(repetitions));

temp = char(fread(x,7));

fprintf(x,duration);
pause(1)
char(fread(x,x.BytesAvailable));

fprintf(x,amplitude);
pause(1)
char(fread(x,x.BytesAvailable));

fprintf(x,repetitions);
pause(1)
char(fread(x,x.BytesAvailable));

input ("press any1 key to start")
pause(2);

disp("stimulus on")
fprintf(x,"GO2");
x.BytesAvailable
while x.BytesAvailable == 0
    x.BytesAvailable;
end    
    
char(fread(x,x.BytesAvailable));
fclose(x);
done = "stimulus done";
end


