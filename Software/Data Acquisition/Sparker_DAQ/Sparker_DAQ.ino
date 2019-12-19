#include "ADS1299.h"

void setup() {
  ADS1299_Module* ADS1299 = new ADS1299_Module(1, 2, 5);
  Serial.println("Setting the value to 10");
  ADS1299->set_value(10);
  Serial.print("Value set to ");
  Serial.println(ADS1299->get_value());

}

void loop() {
  // put your main code here, to run repeatedly:

}
