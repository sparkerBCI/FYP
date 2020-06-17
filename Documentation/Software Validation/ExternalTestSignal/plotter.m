csv = csvread("CH1DEC.csv");
value = (csv.*(4.5/(2^23)))./1;
figure();
plot(1:length(value), value);