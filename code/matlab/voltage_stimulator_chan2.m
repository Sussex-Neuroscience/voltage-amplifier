% script to run the functions to control the arduino used in the electric
% stimulator project.
% code developed by AM Chagas 07/10/2019
% CC-BY-SA 4.0


%%


function stim_chan2 (duration, amplitude, repetitions)
%change the next line to the com port the arduino is connected to:
%ec: port = "COM5";
port = "/dev/ttyACM0";
x=serial(port,'BAUD', 9600);
fopen(x);

appDur = (duration*2*repetitions)/1000;
duration = strcat("DUR2 ",int2str(duration));
amplitude = strcat("AMP2 ",int2str(amplitude));
repetitions = strcat("REP2 ",int2str(repetitions));

fprintf(x,duration);
pause(1)

fprintf(x,amplitude);
pause(1)

fprintf(x,repetitions);
pause(1)

input ("press any key to start")

fprintf(x,"GO2");
pause(appDur+1);
fclose(x);

end


