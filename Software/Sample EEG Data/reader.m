clear
load('CLASubjectA1601083StLRHand.mat');

vector_of_interesting_frequencies = 0.01:0.5:30;

Wn = 30 / o.sampFreq;
[B, A] = butter(10, Wn, 'low');
for channel = 1:21
   channel_data(:, channel) = filter(B, A, o.data(:, channel));
end

changes = logical(diff(o.marker));
indexes = [1, transpose(find(changes)), length(o.marker)];

value_splits = cell(length(indexes)-1, 2);
for i = 1:(length(indexes)-1)
    value_splits(i, 1) = {channel_data(indexes(i):(indexes(i+1)), 20)};
    if o.marker(indexes(i+1)) == 0
        value_splits(i, 2) = {'Idle'};
    elseif o.marker(indexes(i+1)) == 1
        value_splits(i, 2) = {'Left Hand'};
    elseif o.marker(indexes(i+1)) == 2
        value_splits(i, 2) = {'Right Hand'};
    elseif o.marker(indexes(i+1)) == 3
        value_splits(i, 2) = {'Rest'};
    end
        
    %value_splits(i, 2) = {o.marker(indexes(i+1))};
end

inds1 = ~strcmp(value_splits(:, 2), 'Left Hand');
X1 = value_splits(inds1, 1);
y1 = value_splits(inds1, 2);

inds = ~strcmp(y1, 'Rest');
X = X1(inds);
y = y1(inds);

interesting_indicies = zeros(length(X), length(vector_of_interesting_frequencies));
psd = zeros(length(X), length(vector_of_interesting_frequencies));

for observation = 1:length(X)
    data = cell2mat(X(observation));
    Y = fft(data);
    L = length(data);
    P2 = abs(Y/L);
    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
    f = o.sampFreq*(0:(L/2))/L;
    for predict_var = 1:length(vector_of_interesting_frequencies)
        interesting_indicies(observation, predict_var) = fix(find(f > vector_of_interesting_frequencies(predict_var), 1));
    end
    psd(observation, :) = P1(interesting_indicies(observation, :));
end

SVMModel = fitcsvm(psd, y, 'Holdout', 0.2, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactSVMModel,XTest);



table(YTest(1:10),label(1:10),score(1:10,2),'VariableNames', {'TrueLabel','PredictedLabel','Score'})

