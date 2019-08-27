clear
close all
load('CLASubjectA1601083StLRHand.mat');

holdout_percentage = 0.2;

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

tic
SVMModel = fitcsvm(psd, y, 'KernelFunction', 'gaussian', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactSVMModel,XTest);

cp = classperf(YTest, label);
Gauss_SVM_Accuracy = cp.CorrectRate
gauss_svm_time = toc


tic
SVMModel = fitcsvm(psd, y, 'KernelFunction', 'linear', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactSVMModel,XTest);

cp = classperf(YTest, label);
Linear_SVM_Accuracy = cp.CorrectRate
linear_svm_time = toc


tic
SVMModel = fitcsvm(psd, y, 'KernelFunction', 'rbf', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactSVMModel,XTest);

cp = classperf(YTest, label);
RBF_SVM_Accuracy = cp.CorrectRate
rbf_svm_time = toc


tic
SVMModel = fitcsvm(psd, y, 'KernelFunction', 'polynomial', 'Holdout', holdout_percentage, 'Standardize', true);
CompactSVMModel = SVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(SVMModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactSVMModel,XTest);

cp = classperf(YTest, label);
Poly_SVM_Accuracy = cp.CorrectRate
%table(YTest(1:10),label(1:10),score(1:10,2),'VariableNames', {'TrueLabel','PredictedLabel','Score'})
poly_svm_time = toc



tic
LDAModel = fitcdiscr(psd, y, 'Holdout', holdout_percentage, 'DiscrimType', 'linear');
CompactLDAModel = LDAModel.Trained{1}; % Extract trained, compact classifier
testInds = test(LDAModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactLDAModel,XTest);

cp = classperf(YTest, label);
LDA_Accuracy = cp.CorrectRate
lda_time = toc

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


tic
KNNModel = fitcknn(psd, y, 'Holdout', holdout_percentage, 'NumNeighbors', 10, 'Standardize', true);
CompactKNNModel = KNNModel.Trained{1}; % Extract trained, compact classifier
testInds = test(KNNModel.Partition);   % Extract the test indices
XTest = psd(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactKNNModel,XTest);

cp = classperf(YTest, label);
KNN_Accuracy = cp.CorrectRate
knn_time = toc

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

figure()
bar(c, time);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Time');

figure()
bar(c, score);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Score');

