#include "ADS1299.h"

#include "Arduino.h"

/* Create enumerations for settings, etc */

 ADS1299_Module::ADS1299_Module() {
  Serial.begin(9600);
  Serial.println("ADS1299 Module Initialised!");

  

/* Set up SPI interface */
 }

 uint8_t ADS1299_Module::get_value(Reg_ID_t Register) {
  if (Register >= ID && Register < NUM_REGS)
  {
  return Reg_Array[Register].Current_Value;
  }
  return 0xFF;
 }

void ADS1299_Module::set_value(Reg_ID_t Register, uint8_t new_value) {
  if (Register >= ID && Register < NUM_REGS)
  {
  Reg_Array[Register].Current_Value = new_value;
  }
  return;
}
