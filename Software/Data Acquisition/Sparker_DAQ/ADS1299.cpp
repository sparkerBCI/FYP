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

  id_reg  &= 0xE0;              /* Isolate the version section */
  id_reg >>= 5;                 /* Move the version info to bit 0 */
  return(id_reg);
}


uint8_t ADS1299_Module::get_device_id(void)
{
  uint8_t id_reg = read_register(ID);

  id_reg  &= 0x0C;              /* Isolate the device ID section */
  id_reg >>= 2;                 /* Move the device ID to bit 0 */
  return(id_reg);
}


uint8_t ADS1299_Module::get_num_channels(void)
{
  uint8_t id_reg = read_register(ID);

  if (!id_reg)          /* if read_register failed */
  {
    return(0);
  }
  id_reg &= 0x03;       /* Isolate the num channels section */
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

  if (!reg_data)                /* if read_register failed */
  {
    return(false);
  }
  reg_data &= 0x40;             /* Isolate the daisy chain section */
  return(!reg_data);
}


bool ADS1299_Module::set_daisy_mode(bool enable)
{
  if (!enable)
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x40));                   /* Set the 6th bit of the register */
  }
  else
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xBF));                   /* Clear the 6th bit of the register */
  }
}


bool ADS1299_Module::get_clock_mode(void)
{
  uint8_t reg_data = read_register(CONFIG1);

  if (!reg_data)                /* if read_register failed */
  {
    return(false);
  }
  reg_data &= 0x20;             /* Isolate the clock mode section */
  return(reg_data);             /* Reg data will contain a non-zero (0x20) if oscillator output connected to CLK pins, else 0 */
}


bool ADS1299_Module::set_clock_mode(bool enable)
{
  if (enable)
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x20));                   /* Set the 5th bit of the register */
  }
  else
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xDF));                   /* Clear the 5th bit of the register */
  }
}


Data_Rate_Setting_t ADS1299_Module::get_data_rate(void)
{
  uint8_t reg_data = read_register(CONFIG1);

  if (!reg_data)                /* if read_register failed */
  {
    return(SPS_ERROR);
  }
  reg_data &= 0x07;             /* Isolate the clock mode section */

  switch (reg_data)             /* Decode the value */
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
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | new_rate));                       /* Write the new data rate */
  }
  else
  {
    return(false);                                                                                      /* The requested rate is invalid */
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
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | 0x10));                   /* Set the 4th bit of the CONFIG2 register */
  }
  else
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & 0xEF));                   /* Clear the 4th bit of the CONFIG2 register */
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
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | 0x04));                   /* Set the 2nd bit of the CONFIG2 register */
  }
  else
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & 0xFB));                   /* Clear the 2nd bit of the CONFIG2 register */
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
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | static_cast<uint8_t>(new_freq)));                 /* Set the 2nd bit of the CONFIG2 register */
  }
  else
  {
    return(false);                                                                                                      /* The requested frequency is invalid */
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


bool ADS1299_Module::get_bias_measurement_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x10;
  return(reg_data);
}


bool ADS1299_Module::set_bias_measurement_state(bool new_state)
{
  if (new_state)
  {
    return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | 0x10));
  }
  else
  {
    return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value & 0xEF));
  }
}


Bias_Source_t ADS1299_Module::get_bias_source(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x08;
  switch (reg_data)
  {
  case BIAS_INTERNAL:
    return BIAS_INTERNAL;

  case BIAS_EXTERNAL:
    return BIAS_EXTERNAL;

  default:
    return BIAS_ERROR;
  }
}


bool ADS1299_Module::set_bias_source(Bias_Source_t new_source)
{
  if ((new_source >= BIAS_INTERNAL) && (new_source < BIAS_ERROR))
  {
    return write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | ((static_cast<uint8_t>(new_source)) << 3));
  }

  return false;
}


Bias_Power_State_t ADS1299_Module::get_bias_buffer_power_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x04;
  switch (reg_data)
  {
  case BIAS_POWER_OFF:
    return BIAS_POWER_OFF;

  case BIAS_POWER_ON:
    return BIAS_POWER_ON;

  default:
    return BIAS_POWER_ERROR;
  }
}


bool ADS1299_Module::set_bias_power_state(Bias_Power_State_t new_state)
{
  if ((new_state >= BIAS_POWER_OFF) && (new_state < BIAS_POWER_ERROR))
  {
    return write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | ((static_cast<uint8_t>(new_state)) << 2));
  }
  return false;
}


Bias_Sense_Enable_t ADS1299_Module::get_bias_sense_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x02;
  switch (reg_data)
  {
  case BIAS_SENSE_DISABLED:
    return BIAS_SENSE_DISABLED;

  case BIAS_SENSE_ENABLED:
    return BIAS_SENSE_ENABLED;

  default:
    return BIAS_SENSE_ERROR;
  }
}


bool ADS1299_Module::set_bias_sense_state(Bias_Sense_Enable_t new_state)
{
  if ((new_state >= BIAS_SENSE_DISABLED) && (new_state < BIAS_SENSE_ERROR))
  {
    return write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | ((static_cast<uint8_t>(new_state)) << 1));
  }
  return false;
}


Bias_LOff_Status_t ADS1299_Module::get_bias_lead_off_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x01;
  switch (reg_data)
  {
  case BIAS_CONNECTED:
    return BIAS_CONNECTED;

  case BIAS_DISCONNECTED:
    return BIAS_DISCONNECTED;

  default:
    return BIAS_LOFF_ERROR;
  }
}


LOff_Comp_Threshold_Var_t ADS1299_Module::get_lead_off_comp_thresh(void)
{
  uint8_t reg_data = read_register(LOFF);

  reg_data  &= 0xE0;
  reg_data >>= 5;
  switch (reg_data)
  {
  case LOFF_5Per:
    return LOFF_5Per;

  case LOFF_7Per5:
    return LOFF_7Per5;

  case LOFF_10Per:
    return LOFF_10Per;

  case LOFF_12Per5:
    return LOFF_12Per5;

  case LOFF_15Per:
    return LOFF_15Per;

  case LOFF_20Per:
    return LOFF_20Per;

  case LOFF_25Per:
    return LOFF_25Per;

  case LOFF_30Per:
    return LOFF_30Per;

  default:
    return LOFF_THRESH_ERROR;
  }
}


bool ADS1299_Module::set_lead_off_comp_thresh(LOff_Comp_Threshold_Var_t new_thresh)
{
  if ((new_thresh >= LOFF_5Per) && (new_thresh < LOFF_THRESH_ERROR))
  {
    return write_register(LOFF, Reg_Array[LOFF].Current_Value | ((static_cast<uint8_t>(new_thresh)) << 5));
  }
  return false;
}


LOff_Current_t ADS1299_Module::get_lead_off_current_mag(void)
{
  uint8_t reg_data = read_register(LOFF);

  reg_data  &= 0x0C;
  reg_data >>= 2;
  switch (reg_data)
  {
  case LOFF_CURRENT_6nA:
    return LOFF_CURRENT_6nA;

  case LOFF_CURRENT_24nA:
    return LOFF_CURRENT_24nA;

  case LOFF_CURRENT_6uA:
    return LOFF_CURRENT_6uA;

  case LOFF_CURRENT_24uA:
    return LOFF_CURRENT_24uA;

  default:
    return LOFF_CURRENT_ERROR;
  }
}


bool ADS1299_Module::set_lead_off_current_mag(LOff_Current_t new_current)
{
  if ((new_current >= LOFF_CURRENT_6nA) && (new_current < LOFF_CURRENT_ERROR))
  {
    return write_register(LOFF, Reg_Array[LOFF].Current_Value | ((static_cast<uint8_t>(new_current)) << 2));
  }
  return false;
}
