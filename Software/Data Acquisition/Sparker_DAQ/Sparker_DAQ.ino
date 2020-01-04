#include "ADS1299.h"
#include "DAQ_Pin_Map.h"

void setup() {
	Serial.begin(9600);
	DAQ_Pin_Map* Pin_Map = new DAQ_Pin_Map();
	ADS1299_Module* ADS1299 = new ADS1299_Module();
	Serial.println("DAQ Hardware Interaction Module Initialised!");
	Serial.println("ADS1299 Module Initialised!");
	Serial.print("The default value of CH8SET is ");
	Serial.println(ADS1299->get_value(CH8SET));
	Serial.println("Setting CH8SET to 40");
	ADS1299->set_value(CH8SET, 40);
	Serial.print("The new value of CH8SET is ");
	Serial.println(ADS1299->get_value(CH8SET));
	Serial.println("Lighting up Status LED");
	digitalWrite(Pin_Map->Pin_Array[STATUS_LED].Pin, HIGH);
	Serial.println("LED is on");

}

void loop() {
	// put your main code here, to run repeatedly:

}
