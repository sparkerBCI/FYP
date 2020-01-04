#include "ADS1299.h"
#include "DAQ_Pin_Map.h"

void setup() {
	Serial.begin(9600);
	DAQ_Pin_Map* Hardware_Map = new DAQ_Pin_Map();
	ADS1299_Module* ADS1299 = new ADS1299_Module(Hardware_Map);
	Serial.println("DAQ Hardware Interaction Module Initialised!");
	Serial.println("ADS1299 Module Initialised!");
	Serial.print("The default value of CH8SET is ");
	Serial.println(ADS1299->get_value(CH8SET));
	Serial.println("Setting CH8SET to 40");
	ADS1299->set_value(CH8SET, 40);
	Serial.print("The new value of CH8SET is ");
	Serial.println(ADS1299->get_value(CH8SET));
	Serial.println("Lighting up Status LED");
	digitalWrite(Hardware_Map->Pin_Array[STATUS_LED].Pin, HIGH);
	Serial.println("LED is on");



  ADS1299->reset();
  ADS1299->send_command(SDATAC);
  ADS1299->write_register(CONFIG3, 0x40);
  ADS1299->write_register(CONFIG1, 0x96);
  ADS1299->write_register(CH1SET,  0x60);
  ADS1299->write_register(CH2SET,  0x81);
  ADS1299->write_register(CH3SET,  0x81);
  ADS1299->write_register(CH4SET,  0x81);
  ADS1299->write_register(CH5SET,  0x81);
  ADS1299->write_register(CH6SET,  0x81);
  ADS1299->write_register(CH7SET,  0x81);
  ADS1299->write_register(CH8SET,  0x81);
  ADS1299->write_register(MISC1,   0x20);
  ADS1299->send_command(STANDBY);
  

}

void loop() {
	// put your main code here, to run repeatedly:

}
