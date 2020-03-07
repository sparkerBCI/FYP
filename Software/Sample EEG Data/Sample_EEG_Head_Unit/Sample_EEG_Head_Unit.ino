int incomingByte = 0;    // for incoming serial data

void setup() {
    Serial.begin(115200);    // opens serial port, sets data rate to 9600 bps

}

void loop() {
  static char input[50] = {0};
  static int count = 0;
  // send data only when you receive data:
  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();
    if (incomingByte != '\n' && incomingByte != '\r') {
           input[count] = (char)incomingByte;
           count++;
    }
    else {
      char *ptr;
      int32_t sample = strtol(input, &ptr, 10);
      Serial.print(ADC_to_volt(sample));
      Serial.println("V");
      for (int i = 0; i < count; i++) {
        input[i] = 0;
      }
      count = 0;
    }
  }
  
}

double ADC_to_volt(int32_t adc) {
  return (((double)adc * 2.0 * 4.5 / 24.0) / (((int32_t)1)<<24));
}
