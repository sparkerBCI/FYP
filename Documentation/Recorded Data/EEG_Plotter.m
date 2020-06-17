clear all
close all
clc
timescale = 100;
holdout_percentage = 0.1;

%data = tdfread("20200614_1244.txt");
data = tdfread("20200614_1631.txt");

Ch1 = hex2dec(data.Ch1);
% Ch1(Ch1>0.8e6) = mean(Ch1);
% Ch1(Ch1<50e3) = mean(Ch1);

Ch2 = hex2dec(data.Ch2);
% Ch2(Ch2>0.8e6) = mean(Ch2);
% Ch2(Ch2<50e3) = mean(Ch2);
Ch3 = hex2dec(data.Ch3);
% Ch3(Ch3>0.8e6) = mean(Ch3);
% Ch3(Ch3<50e3) = mean(Ch3);

Ch4 = hex2dec(data.Ch4);
% Ch4(Ch4>0.8e6) = mean(Ch4);
% Ch4(Ch4<50e3) = mean(Ch4);

Ch5 = hex2dec(data.Ch5);
% Ch5(Ch5>0.8e6) = mean(Ch5);
% Ch5(Ch5<50e3) = mean(Ch5);

Ch6 = hex2dec(data.Ch6);
% Ch6(Ch6>0.8e6) = mean(Ch6);
% Ch6(Ch6<50e3) = mean(Ch6);

Ch7 = hex2dec(data.Ch7);
% Ch7(Ch7>0.8e6) = mean(Ch7);
% Ch7(Ch7<50e3) = mean(Ch7);

Ch8 = hex2dec(data.Ch8);
% Ch8(Ch8>0.8e6) = mean(Ch8);
% Ch8(Ch8<50e3) = mean(Ch8);

transitions = logical(diff(data.Marker));

if 1
    if 0
        figure();
        for i = 2:length(Ch1)
            if i <= timescale
                subplot(5, 1, 1);
                plot(1:i, Ch1(1:i), 'b');
                xlim([1,i]);
                subplot(5, 1, 2);
                plot(1:i, Ch2(1:i), 'r');
                xlim([1,i]);
                subplot(5, 1, 3);
                plot(1:i, Ch3(1:i), 'g');
                xlim([1,i]);
                subplot(5, 1, 4);
                plot(1:i, Ch4(1:i), 'k');
                xlim([1,i]);
                subplot(5, 1, 5);
                plot(1:i, data.Marker(1:i), 'm');
                xlim([1,i]);
                ylim([-0.1, 1.1]);
            else 
                subplot(5, 1, 1);
                plot((i-timescale):i, Ch1((i-timescale):i), 'b');
                xlim([(i-timescale),i]);
                subplot(5, 1, 2);
                plot((i-timescale):i, Ch2((i-timescale):i), 'r');
                xlim([(i-timescale),i]);
                subplot(5, 1, 3);
                plot((i-timescale):i, Ch3((i-timescale):i), 'g');
                xlim([(i-timescale),i]);
                subplot(5, 1, 4);
                plot((i-timescale):i, Ch4((i-timescale):i), 'k');
                xlim([(i-timescale),i]);
                subplot(5, 1, 5);
                plot((i-timescale):i, data.Marker((i-timescale):i), 'm');
                xlim([(i-timescale),i]);
                ylim([-0.1, 1.1]);
            end
            pause(0.01);
        end
    end

    figure();
    subplot(5, 1, 1);
    plot(1:length(Ch1), Ch1, 'b');
    subplot(5, 1, 2);
    plot(1:length(Ch2), Ch2, 'r');
    subplot(5, 1, 3);
    plot(1:length(Ch3), Ch3, 'g');
    subplot(5, 1, 4);
    plot(1:length(Ch4), Ch4, 'k');
    subplot(5, 1, 5);
    plot(1:length(data.Marker), data.Marker, 'm');



    figure();
    plot(1:length(Ch1), Ch1);

    figure();
    plot(1:length(Ch1), fft(Ch1)); hold on
    plot(1:length(Ch2), fft(Ch2));
    plot(1:length(Ch3), fft(Ch3));
    plot(1:length(Ch4), fft(Ch4));
    title({"Raw EEG Data Frequency Content: Ch1"; "Sample Frequency: 250Hz"});
    xlabel("Frequency Bin");
    ylabel("FFT");

    figure();
    subplot(2, 1, 1);
    plot(1:length(data.Marker), data.Marker);
    title("Marker Edge Detection");
    legend("Marker", "Location", "EastOutside");
    ylim([-0.1, 1.1]);
    subplot(2, 1, 2);
    plot(2:length(data.Marker), transitions , 'r-')
    xlabel("Sample");
    legend("Edge", "Location", "EastOutside");
    ylim([-0.1, 1.1]);
end

Wn = 30 / 250;
[B, A] = butter(10, Wn, 'low');
Ch1 = filter(B, A, Ch1);
Ch2 = filter(B, A, Ch2);
Ch3 = filter(B, A, Ch3);
Ch4 = filter(B, A, Ch4);


transition_indexs = find(transitions);
for observation = 1:(length(transition_indexs)-1)
    observations.Ch1.data(observation, :) = Ch1(transition_indexs((observation)):(transition_indexs((observation))+499));
    observations.Ch1.dct(observation, :) = dct(observations.Ch1.data(observation, :));
    observations.Ch2.data(observation, :) = Ch2(transition_indexs((observation)):(transition_indexs((observation))+499));
    observations.Ch2.dct(observation, :) = dct(observations.Ch2.data(observation, :));
    observations.Ch3.data(observation, :) = Ch3(transition_indexs((observation)):(transition_indexs((observation))+499));
    observations.Ch3.dct(observation, :) = dct(observations.Ch3.data(observation, :));
    observations.Ch4.data(observation, :) = Ch4(transition_indexs((observation)):(transition_indexs((observation))+499));
    observations.Ch4.dct(observation, :) = dct(observations.Ch4.data(observation, :));
    observations.Marker(observation) = data.Marker(transition_indexs(observation)+1);
end

figure();
subplot(2, 1, 1);
clims = [min(min(transpose(observations.Ch1.dct(21:end, 10:100)))), max(max(transpose(observations.Ch1.dct(21:end, 10:100))))];
imagesc(transpose(observations.Ch1.dct(21:end, 1:100)), clims);
ylabel('Frequency Bin');
xlabel('Observation');
title('DCT Coefficients - 250sps');
subplot(2, 1, 2);
stairs(1:length(observations.Marker(21:end)), observations.Marker(21:end));
ylim([-0.1, 1.1]);
xlim([0, 141]);
ylabel({'1 - Right Hand';'0 - Rest'});
xlabel('Observation');

LinSVMModel = fitcsvm(observations.Ch1.dct, observations.Marker, 'KernelFunction', 'linear', 'Holdout', holdout_percentage, 'Standardize', true);
CompactLinSVMModel = LinSVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(LinSVMModel.Partition);   % Extract the test indices
XTest = observations.Ch1.dct(testInds,:);
YTest = observations.Marker(testInds);
tic
[label,score] = predict(CompactLinSVMModel,XTest);
linear_svm_time = toc
cp = classperf(YTest, label);
Linear_SVM_Accuracy = cp.CorrectRate