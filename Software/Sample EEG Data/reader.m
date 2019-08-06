clear
load('CLASubjectA1601083StLRHand.mat');

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

for i = 1:length(X)
    data = cell2mat(X(i));
    Y = fft(data);
    L = length(data);
    P2 = abs(Y/L);
    P1 = P2(1:fix(L/2+1));
    P1(2:end-1) = 2 * P1(2:end-1);
    f = o.sampFreq*(0:(L/2))/L;
    X(i) = {data};
end

%SVMModel = fitcsvm(X, y)



% data = cell2mat(value_splits(4, 1));
% Y = fft(data);
% L = length(data);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2 * P1(2:end-1);
% f = o.sampFreq*(0:(L/2))/L;
% figure();
% plot(f, P1)
% title('Single sided amplitude spectrum');
% xlabel('f(Hz');
% ylabel('|P1(f)|');


% figure();
%  yyaxis right
% %plot(o.marker(60000:60500));
% plot(indexes);
%  yyaxis left
% % %plot(channel_data(60000:60500, 1)); hold on
% plot(o.marker);
% 
% 
% zero_state_indicies = o.marker == 0;
% one_state_indicies = o.marker == 1;
% two_state_indicies = o.marker == 2;
% three_state_indicies = o.marker == 3;