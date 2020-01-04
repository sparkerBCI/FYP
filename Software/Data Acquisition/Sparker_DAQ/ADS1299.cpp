#include <SPI.h>

#include "ADS1299.h"



ADS1299_Module::ADS1299_Module(DAQ_Pin_Map* m_Hardware_Info) {

  Hardware_Info = m_Hardware_Info;

/* Set up SPI interface */
	SPI.beginTransaction(SPISettings(Hardware_Info->SPI_SPEED_HZ, Hardware_Info->SPI_ENDIAN, Hardware_Info->SPI_MODE));
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

uint8_t ADS1299_Module::read_register(Reg_ID_t Register) {
  if (Register >= ID && Register < NUM_REGS) {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
    uint16_t command = (RREG | Reg_Array[Register].Address) << 8;
    uint8_t result = SPI.transfer16(command | 0x00);
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
    return result;
  }
  return 0;
}

uint8_t ADS1299_Module::write_register(Reg_ID_t Register, uint8_t value) {
  if ((Register >= ID) && (Register < NUM_REGS) && !(Reg_Array[Register].Read_Only)) {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
    uint16_t command = (WREG | Reg_Array[Register].Address) << 8;
    SPI.transfer16(command | 0x00);
    SPI.transfer(value);
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
    Reg_Array[Register].Current_Value = value;
    return 1;
  }
  return 0;
}

uint8_t ADS1299_Module::send_command(Command_t command) {
  if (command < RREG) {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
    SPI.transfer(command);
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
    return 1;
  }
  return 0;
}

void ADS1299_Module::reset() {
    send_command(RESET);
    delay(1);
}

uint8_t ADS1299_Module::get_device_version(void) {
    uint8_t id_reg = read_register(ID);
    id_reg &= 0xE0; /* Isolate the version section */
    id_reg >>= 5; /* Move the version info to bit 0 */
    return id_reg;
}

uint8_t ADS1299_Module::get_device_id(void) {
    uint8_t id_reg = read_register(ID);
    id_reg &= 0x0C; /* Isolate the device ID section */
    id_reg >>= 2; /* Move the device ID to bit 0 */
    return id_reg;
}

uint8_t ADS1299_Module::get_num_channels(void) {
    uint8_t id_reg = read_register(ID);
    if (!id_reg) { /* if read_register failed */
      return 0;
    }
    id_reg &= 0x03; /* Isolate the num channels section */
    switch(id_reg) {
      case 0x00 :
        return 4;
      case 0x01 :
        return 6;
      case 0x10 :
        return 8;
      default :
        return 0;
    }
}

bool ADS1299_Module::get_daisy_mode(void) {
    uint8_t reg_data = read_register(CONFIG1);
    if (!reg_data) { /* if read_register failed */
      return false;
    }
    reg_data &= 0x40; /* Isolate the daisy chain section */
    return !reg_data; 
}

bool ADS1299_Module::set_daisy_mode(bool enable) {
    if (enable) {
      return write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x40);   /* Set the 6th bit of the register */
    }
    else {
      return write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xBF);   /* Clear the 6th bit of the register */
    }
}
