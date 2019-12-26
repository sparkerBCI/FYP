#include "ADS1299.h"

void setup() {
  ADS1299_Module* ADS1299 = new ADS1299_Module();
  Serial.print("The default value of CH8SET is ");
  Serial.println(ADS1299->get_value(CH8SET));
  Serial.println("Setting CH8SET to 40");
  ADS1299->set_value(CH8SET, 40);
  Serial.print("The new value of CH8SET is ");
  Serial.println(ADS1299->get_value(CH8SET));

}

void loop() {
  // put your main code here, to run repeatedly:

}
