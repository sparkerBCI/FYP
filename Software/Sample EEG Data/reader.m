load('CLASubjectA1601083StLRHand.mat');

Wn = 30 / o.sampFreq;
[B, A] = butter(10, Wn, 'low');
for channel = 1:21
   channel_data(:, channel) = filter(B, A, o.data(:, channel));
end




figure();
yyaxis left
plot(channel_data(60000:60500, 1)); hold on
yyaxis right
plot(o.marker(60000:60500));

zero_state_indicies = o.marker == 0;
one_state_indicies = o.marker == 1;
two_state_indicies = o.marker == 2;
three_state_indicies = o.marker == 3;