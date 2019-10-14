clear
close all
load('CLA-SubjectJ-170504-3St-LRHand-Inter.mat');
%load('CLASubjectB1510203StLRHand.mat');
%load('CLASubjectA1601083StLRHand.mat');
%load('CLASubjectC1511263StLRHand.mat');

holdout_percentage = 0.2;
epoch_seconds = 2;
vector_of_interesting_frequencies = 0.01:0.5:30;

frequency_plotting = 0;

Wn = 30 / o.sampFreq;
[B, A] = butter(10, Wn, 'low');
for channel = 1:21
   channel_data(:, channel) = filter(B, A, o.data(:, channel));
end

% for channel = 1:21
%     if channel ~= 11
%         channel_data(:, channel) = channel_data(:, channel) - channel_data(:, 11);
%     end
% end



changes = logical(diff(o.marker));
changes_one = find(changes);
changes(changes_one(2:2:end)) = 0;
indexes = [transpose(find(changes)), length(o.marker)];

value_splits = cell(length(indexes)-1, 2);
for i = 1:(length(indexes)-1)
    value_splits(i, 1) = {channel_data(indexes(i):(indexes(i)+epoch_seconds*o.sampFreq), 5)};
    if o.marker(indexes(i)+1) == 0
        value_splits(i, 2) = {'Idle'};
        disp('found idle');
    elseif o.marker(indexes(i)+1) == 1
        value_splits(i, 2) = {'Left Hand'};
    elseif o.marker(indexes(i)+1) == 2
        value_splits(i, 2) = {'Right Hand'};
    elseif o.marker(indexes(i)+1) == 3
        value_splits(i, 2) = {'Rest'};
    end
        
    %value_splits(i, 2) = {o.marker(indexes(i+1))};
end

inds1 = ~strcmp(value_splits(:, 2), 'Left Hand');
X1 = value_splits(inds1, 1);
y1 = value_splits(inds1, 2);

inds = ~strcmp(y1, 'Idle');
X = X1(inds);
y = y1(inds);

interesting_indicies = zeros(length(X), length(vector_of_interesting_frequencies));
psd = zeros(length(X), (2^14+1));

if (frequency_plotting == 1)
 figure();
end
for observation = 1:length(X)

    n = 2^15;
    
    
    data = cell2mat(X(observation));
    Y = fft(gausswin(length(data)).*data, n);
    f = o.sampFreq*(0:(n/2))/n;
    P = abs(Y/n);
    P1 = P(1:n/2+1);

    if (frequency_plotting == 1)
        subplot(1, 3, 3)
        plot(f, P1);
        title({'';'Gaussian Window'});
    end
    
     data = cell2mat(X(observation));
    Y = fft(data, n);
    f = o.sampFreq*(0:(n/2))/n;
    P = abs(Y/n);
    P1 = P(1:n/2+1);

    if (frequency_plotting == 1)
        subplot(1, 3, 1)
        plot(f, P1);
        title({''; 'Rectangular Window'});
    end
    
    data = cell2mat(X(observation));
    Y = fft(hanning(length(data)).*data, n);
    f = o.sampFreq*(0:(n/2))/n;
    P = abs(Y/n);
    P1 = P(1:n/2+1);

    if (frequency_plotting == 1)
        subplot(1, 3, 2)
        plot(f, P1);
        title({y{observation};'Hanning Window'});
    end
    
    
    
%     for predict_var = 1:length(vector_of_interesting_frequencies)
%         interesting_indicies(observation, predict_var) = fix(find(f > vector_of_interesting_frequencies(predict_var), 1));
%     end
    %psd(observation, :) = P1(interesting_indicies(observation, :));
    psd(observation, :) = P1;
end

m = zeros(length(y), 1);
for i = 1:length(y)
    if ~strcmp(y(i), 'Right Hand')
        m(i) = 1;
    else
        m(i) = 0;
    end
end

figure();
subplot(2, 1, 1);
image = transpose(psd(1:100, 1:2458));
%image = transpose(psd(1:100, 1:16000));
imagesc(image);
ylabel('Frequency Bin');
xlabel('Observation');
title('Time-Frequency Heatmap');
subplot(2, 1, 2);
plot(1:length(m(1:100)), m(1:100));
ylim([0, 3]);
ylabel({'1 - Right Hand';'0 - Rest'});
xlabel('Observation');

psd = psd(:, 1:2458);
%psd = psd(:, 1:16000);

SVMModel = fitcsvm(psd, y, 'KernelFunction', 'gaussian', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

tic
[label,score] = predict(CompactSVMModel,XTest);
gauss_svm_time = toc
cp = classperf(YTest, label);
Gauss_SVM_Accuracy = cp.CorrectRate




SVMModel = fitcsvm(psd, y, 'KernelFunction', 'linear', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);
tic
[label,score] = predict(CompactSVMModel,XTest);
linear_svm_time = toc
cp = classperf(YTest, label);
Linear_SVM_Accuracy = cp.CorrectRate



SVMModel = fitcsvm(psd, y, 'KernelFunction', 'rbf', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);
tic
[label,score] = predict(CompactSVMModel,XTest);
rbf_svm_time = toc
cp = classperf(YTest, label);
RBF_SVM_Accuracy = cp.CorrectRate




SVMModel = fitcsvm(psd, y, 'KernelFunction', 'polynomial', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);
tic
[label,score] = predict(CompactSVMModel,XTest);
poly_svm_time = toc
cp = classperf(YTest, label);
Poly_SVM_Accuracy = cp.CorrectRate
%table(YTest(1:10),label(1:10),score(1:10,2),'VariableNames', {'TrueLabel','PredictedLabel','Score'})





LDAModel = fitcdiscr(psd, y, 'Holdout', holdout_percentage, 'DiscrimType', 'linear');
CompactLDAModel = LDAModel.Trained{1}; % Extract trained, compact classifier
testInds = test(LDAModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);
tic
[label,score] = predict(CompactLDAModel,XTest);
lda_time = toc
cp = classperf(YTest, label);
LDA_Accuracy = cp.CorrectRate


% 
% tic
% LDAModel = fitcdiscr(psd, y, 'Holdout', holdout_percentage, 'DiscrimType', 'quadratic');
% CompactLDAModel = LDAModel.Trained{1}; % Extract trained, compact classifier
% testInds = test(LDAModel.Partition);   % Extract the test indices
% XTest = psd(testInds,:);
% YTest = y(testInds,:);
% 
% [label,score] = predict(CompactLDAModel,XTest);
% 
% cp = classperf(YTest, label);
% QDA_Accuracy = cp.CorrectRate
% toc



KNNModel = fitcknn(psd, y, 'Holdout', holdout_percentage, 'NumNeighbors', 10, 'Standardize', true);
CompactKNNModel = KNNModel.Trained{1}; % Extract trained, compact classifier
testInds = test(KNNModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);
tic
[label,score] = predict(CompactKNNModel,XTest);
knn_time = toc
cp = classperf(YTest, label);
KNN_Accuracy = cp.CorrectRate


gauss_svm_score = Gauss_SVM_Accuracy / gauss_svm_time
linear_svm_score = Linear_SVM_Accuracy / linear_svm_time
rbf_svm_score = RBF_SVM_Accuracy / rbf_svm_time
poly_svm_score = Poly_SVM_Accuracy / poly_svm_time
lda_score = LDA_Accuracy / lda_time
knn_score = KNN_Accuracy / knn_time

accuracy = [Gauss_SVM_Accuracy; Linear_SVM_Accuracy; RBF_SVM_Accuracy; Poly_SVM_Accuracy; LDA_Accuracy; KNN_Accuracy];
time = [gauss_svm_time; linear_svm_time; rbf_svm_time; poly_svm_time; lda_time; knn_time];
score = [gauss_svm_score; linear_svm_score; rbf_svm_score; poly_svm_score; lda_score; knn_score];

c = categorical({'Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN'});

figure()
bar(c, accuracy);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Accuracy');
ylim([0, 1]);

figure()
bar(c, time);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Time');

figure()
bar(c, score);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Score');

max_accuracy = max(accuracy)