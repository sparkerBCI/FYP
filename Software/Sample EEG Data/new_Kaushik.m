clear
close all
load('CLASubjectA1601083StLRHand.mat');

holdout_percentage = 0.2;
epoch_seconds = 1;
vector_of_interesting_frequencies = 0.01:0.5:30;

Wn = 30 / o.sampFreq;
[B, A] = butter(10, Wn, 'low');
for channel = 1:21
   channel_data(:, channel) = filter(B, A, o.data(:, channel));
end


% len = 2000;
% jump = 20;
% for st = 1:jump:length(o.data)
%     index = (st:st+len);
%     for jt=1:5
%         figure(jt)
%         for it = 1:4
%             plot(channel_data(index,it+(jt-1)*4)+(it-1)*60);
%             hold on
%         end
%         plot(15*o.marker(index)-60);
%         hold off
%     end
%     %pause
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
psd = zeros(length(X), 1024);

for observation = 1:length(X)
    data = cell2mat(X(observation));
%     y(observation)
    Y = fft(hanning(length(data)).*data,2^15);
    L = length(data);
    P2 = abs(Y/L);
    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
%     figure(1)
%     plot([data; zeros(600-L,1)]);
%     title('Waveform');
%     figure(2)
%     plot(P2)
%     axis([0,4000,0,1.25])
%     title('P2');

    arorder = 15;
    armaorder = 7;
    Topl = toeplitz(data(arorder+1:end),data(arorder+1:-1:1));
    arcoeff = Topl(:,2:end)\Topl(:,1);
    mypoles = roots([1;-arcoeff]);

%     figure(3)
%     scatter(real(mypoles),imag(mypoles))
%     title('AR Poles');
    inno = Topl(:,1) - Topl(:,2:end)*arcoeff;
    Topl1 = toeplitz(data(arorder+armaorder:end),data(arorder+armaorder:-1:arorder+1));
    Topl2 = toeplitz(inno(armaorder:end),inno(armaorder:-1:1));
    armacoeff = [-Topl1(:,2:end), Topl2(:,2:end)]\(Topl1(:,1) - Topl2(:,1));
    [powspec,omega] = freqz([1;armacoeff(armaorder:2*armaorder-2)], [1;armacoeff(1:armaorder-1)],1024);
%     figure(4)
%     plot(omega,abs(powspec));
%     title('AR Power Spec 1');

    [powspecar,omega] = freqz(1,[1;-arcoeff],1024);
%     figure(5)
%     plot(omega,abs(powspecar));
%     title('AR Power Spec 2');
    %if length(data) < 500
		%[frq,amplitudes] = uspa(data);
		%figure(6)
		%stem(frq,abs(amplitudes));
	%end







    %pause

    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
    f = o.sampFreq*(0:(L/2))/L;
    for predict_var = 1:length(vector_of_interesting_frequencies)
        interesting_indicies(observation, predict_var) = fix(find(f > vector_of_interesting_frequencies(predict_var), 1));
    end
    psd(observation, :) = abs(powspec);
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

figure()
bar(c, time);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Time');

figure()
bar(c, score);
%legend('Gauss SVM', 'Linear SVM', 'RBF SVM', 'Polynomial SVM', 'LDA', 'KNN');
title('Score');
