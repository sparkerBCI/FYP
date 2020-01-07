#include <SPI.h>

#include "ADS1299.h"


ADS1299_Module::ADS1299_Module(DAQ_Pin_Map *m_Hardware_Info)
{
   Hardware_Info = m_Hardware_Info;

   /* Set up SPI interface */
   SPI.beginTransaction(SPISettings(Hardware_Info->SPI_SPEED_HZ, Hardware_Info->SPI_ENDIAN, Hardware_Info->SPI_MODE));
}


uint8_t ADS1299_Module::get_value(Reg_ID_t Register)
{
   if ((Register >= ID) && (Register < NUM_REGS))
   {
      return(Reg_Array[Register].Current_Value);
   }
   return(0xFF);
}


void ADS1299_Module::set_value(Reg_ID_t Register, uint8_t new_value)
{
   if ((Register >= ID) && (Register < NUM_REGS))
   {
      if (!Reg_Array[Register].Read_Only)
      {
         Reg_Array[Register].Current_Value = new_value;
      }
   }
}


uint8_t ADS1299_Module::read_register(Reg_ID_t Register)
{
   if ((Register >= ID) && (Register < NUM_REGS))
   {
      digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
      uint16_t command = (RREG | Reg_Array[Register].Address) << 8;
      uint8_t  result  = SPI.transfer16(command & 0xFF00);
      digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
      return(result);
   }
   return(0);
}


uint8_t ADS1299_Module::write_register(Reg_ID_t Register, uint8_t value)
{
   if ((Register >= ID) && (Register < NUM_REGS) && !(Reg_Array[Register].Read_Only))
   {
      digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
      uint16_t command = (WREG | Reg_Array[Register].Address) << 8;
      SPI.transfer16(command & 0xFF00);
      SPI.transfer(value);
      digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
      Reg_Array[Register].Current_Value = value;
      return(1);
   }
   return(0);
}


uint8_t ADS1299_Module::send_command(Command_t command)
{
   if (command < RREG)
   {
      digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
      SPI.transfer(command);
      digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
      return(1);
   }
   return(0);
}


void ADS1299_Module::reset()
{
   send_command(RESET);
   delay(1);
}


uint8_t ADS1299_Module::get_device_version(void)
{
   uint8_t id_reg = read_register(ID);

   id_reg  &= 0xE0;             /* Isolate the version section */
   id_reg >>= 5;                /* Move the version info to bit 0 */
   return(id_reg);
}


uint8_t ADS1299_Module::get_device_id(void)
{
   uint8_t id_reg = read_register(ID);

   id_reg  &= 0x0C;             /* Isolate the device ID section */
   id_reg >>= 2;                /* Move the device ID to bit 0 */
   return(id_reg);
}


uint8_t ADS1299_Module::get_num_channels(void)
{
   uint8_t id_reg = read_register(ID);

   if (!id_reg)         /* if read_register failed */
   {
      return(0);
   }
   id_reg &= 0x03;      /* Isolate the num channels section */
   switch (id_reg)
   {
   case 0x00:
      return(4);

   case 0x01:
      return(6);

   case 0x10:
      return(8);

   default:
      return(0);
   }
}


bool ADS1299_Module::get_daisy_mode(void)
{
   uint8_t reg_data = read_register(CONFIG1);

   if (!reg_data)               /* if read_register failed */
   {
      return(false);
   }
   reg_data &= 0x40;            /* Isolate the daisy chain section */
   return(!reg_data);
}


bool ADS1299_Module::set_daisy_mode(bool enable)
{
   if (!enable)
   {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x40));                 /* Set the 6th bit of the register */
   }
   else
   {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xBF));                 /* Clear the 6th bit of the register */
   }
}


bool ADS1299_Module::get_clock_mode(void)
{
   uint8_t reg_data = read_register(CONFIG1);

   if (!reg_data)               /* if read_register failed */
   {
      return(false);
   }
   reg_data &= 0x20;            /* Isolate the clock mode section */
   return(reg_data);            /* Reg data will contain a non-zero (0x20) if oscillator output connected to CLK pins, else 0 */
}


bool ADS1299_Module::set_clock_mode(bool enable)
{
   if (enable)
   {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x20));                 /* Set the 5th bit of the register */
   }
   else
   {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xDF));                 /* Clear the 5th bit of the register */
   }
}


Data_Rate_Setting_t ADS1299_Module::get_data_rate(void)
{
   uint8_t reg_data = read_register(CONFIG1);

   if (!reg_data)               /* if read_register failed */
   {
      return(SPS_ERROR);
   }
   reg_data &= 0x07;            /* Isolate the clock mode section */

   switch (reg_data)            /* Decode the value */
   {
   case SPS16k:
      return(SPS16k);

   case SPS8k:
      return(SPS8k);

   case SPS4k:
      return(SPS4k);

   case SPS2k:
      return(SPS2k);

   case SPS1k:
      return(SPS1k);

   case SPS500:
      return(SPS500);

   case SPS250:
      return(SPS250);

   default:
      return(SPS_ERROR);
   }
}


bool ADS1299_Module::set_data_rate(Data_Rate_Setting_t new_rate)
{
   if ((new_rate >= SPS16k) && (new_rate < SPS_ERROR))
   {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | new_rate));                     /* Write the new data rate */
   }
   else
   {
      return(false);                                                                                    /* The requested rate is invalid */
   }
}


bool ADS1299_Module::get_int_cal(void)
{
   uint8_t reg_data = read_register(CONFIG2);

   reg_data &= 0x10;
   return(reg_data);
}


bool ADS1299_Module::set_int_cal(bool state)
{
   if (state)
   {
      return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | 0x10));                 /* Set the 4th bit of the CONFIG2 register */
   }
   else
   {
      return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & 0xEF));                 /* Clear the 4th bit of the CONFIG2 register */
   }
}


bool ADS1299_Module::get_cal_amp(void)
{
   uint8_t reg_data = read_register(CONFIG2);

   reg_data &= 0x04;
   return(reg_data);
}


bool ADS1299_Module::set_cal_amp(bool state)
{
   if (state)
   {
      return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | 0x04));                 /* Set the 2nd bit of the CONFIG2 register */
   }
   else
   {
      return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & 0xFB));                 /* Clear the 2nd bit of the CONFIG2 register */
   }
}


Test_Frequency_t ADS1299_Module::get_cal_freq(void)
{
   uint8_t reg_data = read_register(CONFIG2);

   reg_data &= 0x03;
   switch (reg_data)
   {
   case TEST_FREQ_FCLK_DIV_2_21:
      return(TEST_FREQ_FCLK_DIV_2_21);

   case TEST_FREQ_FCLK_DIV_2_20:
      return(TEST_FREQ_FCLK_DIV_2_20);

   case TEST_FREQ_0:
      return(TEST_FREQ_0);

   default:
      return(TEST_FREQ_INVALID);
   }
}


bool ADS1299_Module::set_cal_freq(Test_Frequency_t new_freq)
{
   if ((new_freq >= TEST_FREQ_FCLK_DIV_2_21) && (new_freq <= TEST_FREQ_0) && (new_freq != TEST_FREQ_INVALID))
   {
      return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | static_cast<uint8_t>(new_freq)));               /* Set the 2nd bit of the CONFIG2 register */
   }
   else
   {
      return(false);                                                                                                    /* The requested frequency is invalid */
   }
}


bool ADS1299_Module::get_reference_buffer_state(void)
{
   uint8_t reg_data = read_register(CONFIG3);

   reg_data &= 0x80;
   return(reg_data);
}


bool ADS1299_Module::set_reference_buffer_state(bool new_state)
{
   if (new_state)
   {
      return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | 0x80));
   }
   else
   {
      return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value & 0x7F));
   }
}
