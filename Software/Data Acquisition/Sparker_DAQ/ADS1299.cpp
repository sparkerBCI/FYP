#include <SPI.h>

#include "ADS1299.h"



ADS1299_Module::ADS1299_Module() {

/* Set up SPI interface */
	SPI.beginTransaction(SPISettings(4000000,MSBFIRST, SPI_MODE1));
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
		if (!Reg_Array[Register].Read_Only)
		{
			Reg_Array[Register].Current_Value = new_value;
		}
	}
	return;
}
