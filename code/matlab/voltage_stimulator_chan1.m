% script to run the functions to control the arduino used in the electric
% stimulator project.
% code developed by AM Chagas 07/10/2019
% CC-BY-SA 4.0


%%


function stim_chan1 (duration, amplitude, repetitions)
%change the next line to the com port the arduino is connected to:
%ec: port = "COM5";
port = "/dev/ttyACM1";
x=serial(port,'BAUD', 9600);
fopen(x);

appDuration = duration*2*repetitions/1000;
duration = strcat("DUR1 ",int2str(duration));
amplitude = strcat("AMP1 ",int2str(amplitude));
repetitions = strcat("REP1 ",int2str(repetitions));

fprintf(x,duration);
pause(1)

fprintf(x,amplitude);
pause(1)

fprintf(x,repetitions);
pause(1)

input ("press any1 key to start")
pause(1);
disp("stimulus on")
fprintf(x,"GO1");
pause(appDuration+1);
disp("stimulus off")
fclose(x);

end
