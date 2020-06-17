clear
close all
load('CLA-SubjectJ-170504-3St-LRHand-Inter.mat');
%load('CLASubjectB1510203StLRHand.mat');
%load('CLASubjectA1601083StLRHand.mat');
%load('CLASubjectC1511263StLRHand.mat');

holdout_percentage = 0.2;
epoch_seconds = 2;

Wn = 30 / o.sampFreq;
[B, A] = butter(10, Wn, 'low');
for channel = 1:21
   channel_data(:, channel) = filter(B, A, o.data(:, channel));
end


changes = logical(diff(o.marker));
changes_one = find(changes);
changes(changes_one(2:2:end)) = 0;
indexes = [transpose(find(changes)), length(o.marker)];

value_splits = cell(length(indexes)-1, 2);
data_num_label = zeros(length(indexes)-1, 1);   % vector of data labels -1 for rest, 1 for open, 0 if error
for i = 1:(length(indexes)-1)
    value_splits(i, 1) = {channel_data(indexes(i):(indexes(i)+epoch_seconds*o.sampFreq), 5)};
    if o.marker(indexes(i)+1) == 0
        value_splits(i, 2) = {'Idle'};
        disp('found idle');
        data_num_label(i) = 0;
    elseif o.marker(indexes(i)+1) == 1
        value_splits(i, 2) = {'Left Hand'};
        data_num_label(i) = 0;
    elseif o.marker(indexes(i)+1) == 2
        value_splits(i, 2) = {'Right Hand'};
        data_num_label(i) = 1;
    elseif o.marker(indexes(i)+1) == 3
        value_splits(i, 2) = {'Rest'};
        data_num_label(i) = -1;
    end
        
    %value_splits(i, 2) = {o.marker(indexes(i+1))};
end

inds1 = ~strcmp(value_splits(:, 2), 'Left Hand');
X1 = value_splits(inds1, 1);
y1 = value_splits(inds1, 2);
data_labels = data_num_label(inds1);

inds = ~strcmp(y1, 'Idle');
X = X1(inds);
y = y1(inds);

for observation = 1:length(X)

    data = cell2mat(X(observation));
    data = data(1:256);
    windowed_data = hanning(length(data)).*data;
    Y = dct(windowed_data);
    
    psd(observation, :) = Y;
    all_data(observation, :) = windowed_data;
end


LinSVMModel = fitcsvm(psd, y, 'KernelFunction', 'linear', 'Holdout', holdout_percentage, 'Standardize', true);
CompactLinSVMModel = LinSVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(LinSVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);
tic
[label,score] = predict(CompactLinSVMModel,XTest);
linear_svm_time = toc
cp = classperf(YTest, label);
Linear_SVM_Accuracy = cp.CorrectRate



W = CompactLinSVMModel.Beta
b = CompactLinSVMModel.Bias
s = CompactLinSVMModel.KernelParameters.Scale


linear_svm_score = Linear_SVM_Accuracy / linear_svm_time

vect_str = "";
for i = 1:length(W)
    vect_str = vect_str +  sprintf("%010ld\n", round(100000*W(i)));
end

dets_str = sprintf("%010ld\n%010ld\n%010ld\n", round(100000*s), round(100000*b), round(100000*length(W)));
for i = 4:length(W)
    dets_str = dets_str + sprintf("0000000000\n");
end

disp("Parsed model into strings. Sending to device...");

s = serial('COM14', 'BaudRate', 38400, 'TimeOut', 10, 'Terminator', 'LF');
s.OutputBufferSize = 4096;
fopen(s);
fwrite(s, vect_str);
pause(3);
disp("Weight vector sent, sending model details...");
fwrite(s, dets_str);
pause(3);
disp("Complete!");

samp_str = "";
for i = 1:256
    samp_str = samp_str + sprintf("%010ld\n", round(all_data(8, i) * 100000));
end
fwrite(s, samp_str);

fclose(s);
instrreset