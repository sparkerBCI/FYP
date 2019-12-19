#include "ADS1299.h"

#include "Arduino.h"

/* Create enumerations for settings, etc */

 ADS1299_Module::ADS1299_Module(int TX, int RX, int num_channels) {
//  Serial.begin(9600);
//  Serial.print("The TX pin is ");
//  Serial.println(TX);
//  Serial.print("The RX pin is ");
//  Serial.println(RX);
//  Serial.print("There are ");
//  Serial.print(num_channels);
//  Serial.println(" channels.");

/* Set up SPI interface */
 }

 int ADS1299_Module::get_value() {
  return value;
 }

void ADS1299_Module::set_value(int new_value) {
  value = new_value;
}
