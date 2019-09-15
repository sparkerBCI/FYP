clear
close all
load('CLASubjectA1601083StLRHand.mat');

epoch_seconds = 2;
frequency_plotting = 0;
holdout_percentage = 0.2;


Wn = 30 / o.sampFreq;
[B, A] = butter(12, Wn, 'low');
for channel = 1:21
    channel_data(:, channel) = filter(B, A, o.data(:, channel));
end

%channel_data = o.data;
%pause

TrainDataLength = 15000;
order_AR = 10;
z = (channel_data(1:TrainDataLength,1:20))';
z_data = z(:,order_AR+1:TrainDataLength);
z_rgsr = [];
for i = 1:order_AR
    z_rgsr = [z_rgsr;z(:,order_AR+1-i:TrainDataLength-i)];
end
Aest = -z_data/z_rgsr;
resi = z_data + Aest*z_rgsr;

residual = zeros(20,length(o.data));
for it = TrainDataLength+1:length(o.data)
    X = (channel_data(it-1:-1:it-order_AR,1:20))';
    residual(:,it) = (channel_data(it,1:20))' + Aest*X(:);
end 

% len = 10000;
% jump = 300;
% for st = TrainDataLength+1:jump:TrainDataLength+100000
%     index = (st:st+len);
%     resi = (residual(:,index))';
%     for jt=1:5
%         figure(jt)
%         for it = 1:4
%             plot(resi(:,it+(jt-1)*4)+(it-1)*0.0005);
%             hold on
%         end
%         plot(0.0001*o.marker(index)-0.0005);
%         hold off
%     end
%     pause(0.25)
% end




changes = logical(diff(o.marker));
changes_one = find(changes);
changes(changes_one(2:2:end)) = 0;
indexes = [transpose(find(changes)), length(o.marker)];

residual = transpose(residual);

value_splits = cell(length(indexes)-1, 2);
for i = 1:(length(indexes)-1)
    value_splits(i, 1) = {residual(indexes(i):(indexes(i)+epoch_seconds*o.sampFreq), 5)};
    if o.marker(indexes(i)+1) == 0
        value_splits(i, 2) = {'Idle'};
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

psd = zeros(length(X), 100);

if (frequency_plotting == 1)
 figure();
end


for observation = 1:length(X)
    
    
    data = cell2mat(X(observation));
    Y = fft(data, 256);
    L = length(data);
    P2 = abs(Y/L);
    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
    f = o.sampFreq*(0:(L/2))/L;
    title(cell2mat(y(observation)));
    
    if (frequency_plotting == 1)
        subplot(1, 3, 1)
        plot(1:length(P1), P1);
    end
    
    data = cell2mat(X(observation));
    Y = fft(gausswin(length(data)).*data, 256);
    L = length(data);
    P2 = abs(Y/L);
    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
    f = o.sampFreq*(0:(L/2))/L;
    
    if (frequency_plotting == 1)
        subplot(1, 3, 3)
        plot(1:length(P1), P1);
    end
    
    data = cell2mat(X(observation));
    Y = fft(hanning(length(data)).*data, 256);
    L = length(data);
    P2 = abs(Y/L);
    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
    f = o.sampFreq*(0:(L/2))/L;
    
    if (frequency_plotting == 1)
        subplot(1, 3, 2)
        plot(1:length(P1), P1);
    end
    
    
%     for predict_var = 1:length(vector_of_interesting_frequencies)
%         interesting_indicies(observation, predict_var) = fix(find(f > vector_of_interesting_frequencies(predict_var), 1));
%     end
    %psd(observation, :) = P1(interesting_indicies(observation, :));
    psd(observation, :) = P1(1:100);
end


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

