clear all
clc

s = serial('COM14', 'BaudRate', 38400, 'TimeOut', 10, 'Terminator', 'LF');
fopen(s);
fwrite(s, "-000010123,0000011003,0000012995,0000013111,0000014222,0000015000,0000016000,0000017000,0000018000,0000019000,0000020000,0000021000,0000022000,0000023000,0000024000,0000025000,");
pause(1);
fwrite(s, "0000001000,0000000100,0000016000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,0000000000,");
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