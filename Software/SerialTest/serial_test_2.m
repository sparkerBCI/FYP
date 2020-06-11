clear all
clc

s = serial('COM14', 'BaudRate', 38400, 'TimeOut', 10, 'Terminator', 'LF');
fopen(s);
fwrite(s, "0000000000,0000000001,0000000002,0000000003,0000000004,0000000005,0000000006,0000000007,0000000008,0000000009,0000000010,0000000011,0000000012,0000000013,0000000014,0000000015,");
index = 1;
while(1)
  received = fgets(s);
  temp_coeff = str2double(received(3:end-2)) / 100;
  if (~isnan(temp_coeff))
      coeffs(index) = temp_coeff;
      index = index+1;
  end
  if (index == 17)
      break;
  end
end
fclose(s)
instrreset