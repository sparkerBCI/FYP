instrreset
clear
close all
load('CLA-SubjectJ-170504-3St-LRHand-Inter.mat');
arduinoCom = serial('COM6','BaudRate',115200);
set(arduinoCom, 'Timeout', 0.01, 'OutputBufferSize', 100, 'InputBufferSize', 100, 'Terminator', 'V');

Wn = 30 / o.sampFreq;
[B, A] = butter(10, Wn, 'low');
for channel = 1:21
   channel_data(:, channel) = filter(B, A, o.data(:, channel));
   ADC_Data(:, channel) = ADC_Read(channel_data(:, channel));
end


fopen(arduinoCom);    
epoch_volts = zeros(250, 1);

    for i = 1:length(ADC_Data(:, 1))
         tic
         fprintf(arduinoCom,'%s\n\r', int2str(ADC_Data(i, 1))); %this will send to the arduino
         elapsed_time = toc
         pause((1/250) - elapsed_time);
%          ret_str = fscanf (arduinoCom);
%          ret_str = ret_str(1:(end-1));
%          epoch_volts(i) = str2double(ret_str);
%          if (isnan(epoch_volts(i)))
%              epoch_volts(i) = 0;
%          end
    end


     
%     
%     residuals = epoch_volts - channel_data(1:250, 1);
%     max_error = max(abs(residuals))

    instrreset
    
function result32 = ADC_Read(volts) 
    v_ref = 4.5;
    gain = 24;
    result = volts * gain * 2^24 / (2 * v_ref);
    result32 = int32(result);
end