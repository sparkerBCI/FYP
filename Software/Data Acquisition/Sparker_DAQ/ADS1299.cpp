#include <SPI.h>

/* $Rev$ */

#include "ADS1299.h"

#define NUM_CHANNELS    8


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
    Reg_Array[Register].Current_Value = result;
    return(result);
  }
  return(0);
}


uint8_t ADS1299_Module::read_register(int Register_Address)
{
  Reg_ID_t temp_ID = get_Reg_ID_from_Address(Register_Address);

  if (temp_ID != REG_ERROR)
  {
    return read_register(temp_ID);
  }
  return(0);
}


Reg_ID_t ADS1299_Module::get_Reg_ID_from_Address(uint8_t register_address)
{
  for (int i = 0; i < NUM_REGS; i++)
  {
    if (register_address == Reg_Array[i].Address)
    {
      return Reg_Array[i].Reg_ID;
    }
  }
  return REG_ERROR;
}


bool ADS1299_Module::write_register(Reg_ID_t Register, uint8_t value)
{
  if ((Register >= ID) && (Register < NUM_REGS) && !(Reg_Array[Register].Read_Only))
  {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
    uint16_t command = (WREG | Reg_Array[Register].Address) << 8;
    SPI.transfer16(command & 0xFF00);                                                              //Think the bitwise op can be removed, bitshifting should always pad with 0s
    SPI.transfer(value);
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
    Reg_Array[Register].Current_Value = value;
    return(true);
  }
  return(false);
}


bool ADS1299_Module::write_register(int Register_Address, uint8_t value)
{
  Reg_ID_t temp_ID = get_Reg_ID_from_Address(Register_Address);

  if (temp_ID != REG_ERROR)
  {
    return write_register(temp_ID, value);
  }
  return false;
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

  id_reg  &= 0xE0;                                                                                 /* Isolate the version section */
  id_reg >>= 5;                                                                                    /* Move the version info to bit 0 */
  return(id_reg);
}


uint8_t ADS1299_Module::get_device_id(void)
{
  uint8_t id_reg = read_register(ID);

  id_reg  &= 0x0C;                                                                                 /* Isolate the device ID section */
  id_reg >>= 2;                                                                                    /* Move the device ID to bit 0 */
  return(id_reg);
}


uint8_t ADS1299_Module::get_num_channels(void)
{
  uint8_t id_reg = read_register(ID);

  if (!id_reg)                                                                                     /* if read_register failed */
  {
    return(0);
  }
  id_reg &= 0x03;                                                                                  /* Isolate the num channels section */
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

  if (!reg_data)                                                                                   /* if read_register failed */
  {
    return(false);
  }
  reg_data &= 0x40;                                                                                /* Isolate the daisy chain section */
  return(!reg_data);
}


bool ADS1299_Module::set_daisy_mode(bool enable)
{
  if (!enable)
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x40));                      /* Set the 6th bit of the register */
  }
  else
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xBF));                      /* Clear the 6th bit of the register */
  }
}


bool ADS1299_Module::get_clock_mode(void)
{
  uint8_t reg_data = read_register(CONFIG1);

  if (!reg_data)                                                                                   /* if read_register failed */
  {
    return(false);
  }
  reg_data &= 0x20;                                                                                /* Isolate the clock mode section */
  return(reg_data);                                                                                /* Reg data will contain a non-zero (0x20) if oscillator output connected to CLK pins, else 0 */
}


bool ADS1299_Module::set_clock_mode(bool enable)
{
  if (enable)
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x20));                      /* Set the 5th bit of the register */
  }
  else
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xDF));                      /* Clear the 5th bit of the register */
  }
}


Data_Rate_Setting_t ADS1299_Module::get_data_rate(void)
{
  uint8_t reg_data = read_register(CONFIG1);

  if (!reg_data)                                                                                   /* if read_register failed */
  {
    return(SPS_ERROR);
  }
  reg_data &= 0x07;                                                                                /* Isolate the clock mode section */

  switch (reg_data)                                                                                /* Decode the value */
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
    uint8_t value = Reg_Array[CONFIG1].Current_Value & 0xF8;                                       /* Clear the old data */
    return(write_register(CONFIG1, value | new_rate));                                             /* Write the new data rate */
  }
  else
  {
    return(false);                                                                                 /* The requested rate is invalid */
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
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | 0x10));                      /* Set the 4th bit of the CONFIG2 register */
  }
  else
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & 0xEF));                      /* Clear the 4th bit of the CONFIG2 register */
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
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | 0x04));                      /* Set the 2nd bit of the CONFIG2 register */
  }
  else
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & 0xFB));                      /* Clear the 2nd bit of the CONFIG2 register */
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
    uint8_t value = Reg_Array[CONFIG2].Current_Value & 0xFC;                                       /* Clear the old data */
    return(write_register(CONFIG2, value | static_cast<uint8_t>(new_freq)));                       /* Set the bits of the CONFIG2 register */
  }
  else
  {
    return(false);                                                                                 /* The requested frequency is invalid */
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

  reg_data  &= 0x08;
  reg_data >>= 3;
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
    uint8_t value = Reg_Array[CONFIG3].Current_Value & 0xF7;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_source)) << 3));
  }

  return false;
}


Bias_Power_State_t ADS1299_Module::get_bias_buffer_power_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data  &= 0x04;
  reg_data >>= 2;
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
    uint8_t value = Reg_Array[CONFIG3].Current_Value & 0xFB;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_state)) << 2));
  }
  return false;
}


Bias_Sense_Enable_t ADS1299_Module::get_bias_sense_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data  &= 0x02;
  reg_data >>= 1;
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
    uint8_t value = Reg_Array[CONFIG3].Current_Value & 0xFD;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_state)) << 1));
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
    uint8_t value = Reg_Array[LOFF].Current_Value & 0x1F;
    return write_register(LOFF, value | ((static_cast<uint8_t>(new_thresh)) << 5));
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
    uint8_t value = Reg_Array[LOFF].Current_Value & 0xF3;
    return write_register(LOFF, value | ((static_cast<uint8_t>(new_current)) << 2));
  }
  return false;
}


LOff_Freq_t ADS1299_Module::get_lead_off_frequency(void)
{
  uint8_t reg_data = read_register(LOFF);

  reg_data &= 0x03;
  switch (reg_data)
  {
  case LOFF_FREQ_DC:
    return LOFF_FREQ_DC;

  case LOFF_FREQ_7Hz8:
    return LOFF_FREQ_7Hz8;

  case LOFF_FREQ_31Hz2:
    return LOFF_FREQ_31Hz2;

  case LOFF_FREQ_SPS_OVER_4:
    return LOFF_FREQ_SPS_OVER_4;

  default:
    return LOFF_FREQ_ERROR;
  }
}


bool ADS1299_Module::set_lead_off_frequency(LOff_Freq_t new_freq)
{
  if ((new_freq >= LOFF_FREQ_DC) && (new_freq < LOFF_FREQ_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & 0xFC;
    return write_register(LOFF, value | (static_cast<uint8_t>(new_freq)));
  }
  return false;
}


Channel_Power_State_t ADS1299_Module::get_channel_power_state(Channel_t channel)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data  &= 0x80;
    reg_data >>= 7;
    switch (reg_data)
    {
    case CH_POWER_ON:
      return CH_POWER_ON;

    case CH_POWER_OFF:
      return CH_POWER_OFF;

    default:
      return CH_POWER_ERROR;
    }
  }
  else
  {
    return CH_POWER_ERROR;
  }
}


bool ADS1299_Module::set_channel_power_state(Channel_t channel, Channel_Power_State_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= CH_POWER_ON) && (new_state < CH_POWER_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0x7F;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << 7));
  }
  else
  {
    return false;
  }
}


Gain_Setting_t ADS1299_Module::get_channel_gain(Channel_t channel)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data  &= 0x70;
    reg_data >>= 4;
    switch (reg_data)
    {
    case PGA1:
      return PGA1;

    case PGA2:
      return PGA2;

    case PGA4:
      return PGA4;

    case PGA6:
      return PGA6;

    case PGA8:
      return PGA8;

    case PGA12:
      return PGA12;

    case PGA24:
      return PGA24;

    default:
      return PGA_ERROR;
    }
  }
  else
  {
    return PGA_ERROR;
  }
}


bool ADS1299_Module::set_channel_gain(Channel_t channel, Gain_Setting_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= PGA1) && (new_state < PGA_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0x8F;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << 4));
  }
  return false;
}


SRB2_Connection_Status_t ADS1299_Module::get_channel_SRB2_connection_status(Channel_t channel)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data  &= 0x04;
    reg_data >>= 3;
    switch (reg_data)
    {
    case SRB2_OPEN:
      return SRB2_OPEN;

    case SRB2_CLOSED:
      return SRB2_CLOSED;

    default:
      return SRB2_ERROR;
    }
  }

  return SRB2_ERROR;
}


bool ADS1299_Module::set_channel_SRB2_connection_status(Channel_t channel, SRB2_Connection_Status_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= SRB2_OPEN) && (new_state < SRB2_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0xF7;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << 3));
  }

  return false;
}


Channel_Connection_Type_t ADS1299_Module::get_channel_connection_type(Channel_t channel)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data &= 0x03;
    switch (reg_data)
    {
    case CH_ELECTRODE_INPUT:
      return CH_ELECTRODE_INPUT;

    case CH_SHORTED:
      return CH_SHORTED;

    case CH_BIAS_MEAS:
      return CH_BIAS_MEAS;

    case CH_SUPPLY_MEAS:
      return CH_SUPPLY_MEAS;

    case CH_TEMP_SENS:
      return CH_TEMP_SENS;

    case CH_TEST_SIG:
      return CH_TEST_SIG;

    case CH_BIAS_DRIVE_POS:
      return CH_BIAS_DRIVE_POS;

    case CH_BIAS_DRIVE_NEG:
      return CH_BIAS_DRIVE_NEG;

    default:
      return CH_CONNECTION_ERROR;
    }
  }

  return CH_CONNECTION_ERROR;
}


bool ADS1299_Module::set_channel_connection_type(Channel_t channel, Channel_Connection_Type_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= CH_ELECTRODE_INPUT) && (new_state < CH_CONNECTION_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0xF8;
    return write_register(Reg_Array[CH1SET].Address + channel, value | (static_cast<uint8_t>(new_state)));
  }
  return false;
}


bool ADS1299_Module::get_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (Register >= ID) && (Register < NUM_REGS))
  {
    uint8_t reg_data = read_register(Register);
    uint8_t bitmask  = 0x01 << channel;
    reg_data &= bitmask;
    return reg_data;
  }

  return false;
}


bool ADS1299_Module::set_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel, bool new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (Register >= ID) && (Register < NUM_REGS))
  {
    if (new_state)
    {
      uint8_t bitmask = 0x01 << channel;
      return write_register(Register, Reg_Array[Register].Current_Value | bitmask);
    }
    else
    {
      uint8_t bitmask = 0xFF & (0xFE << channel);
      return write_register(Register, Reg_Array[Register].Current_Value & bitmask);
    }
  }
  return false;
}


bool ADS1299_Module::get_channel_bias_drive_pos_derivation(Channel_t channel)
{
  return get_bit_addressable_channel_info(BIAS_SENSP, channel);
}


bool ADS1299_Module::set_channel_bias_drive_pos_derivation(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(BIAS_SENSP, channel, new_state);
}


bool ADS1299_Module::get_channel_bias_drive_neg_derivation(Channel_t channel)
{
  return get_bit_addressable_channel_info(BIAS_SENSN, channel);
}


bool ADS1299_Module::set_channel_bias_drive_neg_derivation(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(BIAS_SENSN, channel, new_state);
}


bool ADS1299_Module::get_channel_LOff_pos_enabled(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_SENSP, channel);
}


bool ADS1299_Module::set_channel_LOff_pos_enabled(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(LOFF_SENSP, channel, new_state);
}


bool ADS1299_Module::get_channel_LOff_neg_enabled(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_SENSN, channel);
}


bool ADS1299_Module::set_channel_LOff_neg_enabled(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(LOFF_SENSN, channel, new_state);
}


bool ADS1299_Module::get_channel_LOff_flip_enabled(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_FLIP, channel);
}


bool ADS1299_Module::set_channel_LOff_flip_enabled(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(LOFF_FLIP, channel, new_state);
}


bool ADS1299_Module::get_channel_LOff_pos(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_STATP, channel);
}


bool ADS1299_Module::get_channel_LOff_neg(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_STATN, channel);
}


GPIO_Mode_t ADS1299_Module::get_GPIO_Pin_Mode(GPIO_Pin_t pin)
{
  if ((pin >= GPIO1) && (pin < GPIO_ERROR))
  {
    uint8_t reg_data = read_register(GPIO);
    uint8_t bitmask  = 0x01 << pin;
    reg_data &= bitmask;
    if (reg_data)
    {
      return GPIO_INPUT;
    }
    else
    {
      return GPIO_OUTPUT;
    }
  }
  return GPIO_MODE_ERROR;
}


bool ADS1299_Module::set_GPIO_Pin_Mode(GPIO_Pin_t pin, GPIO_Mode_t mode)
{
  if ((pin >= GPIO1) && (pin < GPIO_ERROR) && (mode >= GPIO_OUTPUT) && (mode < GPIO_MODE_ERROR))
  {
    if (mode)
    {
      uint8_t bitmask = 0x01 << pin;
      return write_register(GPIO, Reg_Array[GPIO].Current_Value | bitmask);
    }
    else
    {
      uint8_t bitmask = 0xFF & (0xFE << pin);
      return write_register(GPIO, Reg_Array[GPIO].Current_Value | bitmask);
    }
  }

  return false;
}


bool ADS1299_Module::get_GPIO_Pin_State(GPIO_Pin_t pin)
{
  if ((pin >= GPIO1) && (pin < GPIO_ERROR))
  {
    uint8_t reg_data = read_register(GPIO);
    uint8_t bitmask  = 0x10 << pin;
    return(reg_data & bitmask);
  }
  return false;
}


bool ADS1299_Module::set_GPIO_Pin_State(GPIO_Pin_t pin, bool state)
{
  if ((pin >= GPIO1) && (pin < GPIO_ERROR) && (state >= GPIO_OUTPUT) && (state < GPIO_MODE_ERROR))
  {
    if (state)
    {
      uint8_t bitmask = 0x10 << pin;
      return write_register(GPIO, Reg_Array[GPIO].Current_Value | bitmask);
    }
    uint8_t bitmask = 0xFF & (0xEF << pin);
    return write_register(GPIO, Reg_Array[GPIO].Current_Value & bitmask);
  }

  return false;
}


SRB1_Connection_Status_t ADS1299_Module::get_all_channel_SRB1_connection_status(void)
{
  uint8_t reg_data = read_register(MISC1);

  reg_data &= 0x20;
  switch (reg_data)
  {
  case SRB1_OPEN_ALL_CHANNELS:
    return SRB1_OPEN_ALL_CHANNELS;

  case SRB1_CLOSED_ALL_CHANNELS:
    return SRB1_CLOSED_ALL_CHANNELS;

  default:
    return SRB1_ERROR;
  }
}


bool ADS1299_Module::set_all_channel_SRB1_connection_status(SRB1_Connection_Status_t new_state)
{
  if ((new_state >= SRB1_OPEN_ALL_CHANNELS) && (new_state < SRB1_ERROR))
  {
    if (new_state)
    {
      return write_register(MISC1, Reg_Array[MISC1].Current_Value | 0x20);
    }
    return write_register(MISC1, Reg_Array[MISC1].Current_Value & 0xDF);
  }
  return false;
}


LOff_Conv_Mode_t ADS1299_Module::get_LOff_conversion_mode(void)
{
  uint8_t reg_data = read_register(CONFIG4);

  reg_data  &= 0x04;
  reg_data >>= 3;
  switch (reg_data)
  {
  case LOFF_CONTINUOUS_CONVERSION:
    return LOFF_CONTINUOUS_CONVERSION;

  case LOFF_SINGLE_SHOT:
    return LOFF_SINGLE_SHOT;

  default:
    return LOFF_CONV_MODE_ERROR;
  }
}


bool ADS1299_Module::set_LOff_conversion_mode(LOff_Conv_Mode_t new_state)
{
  if ((new_state >= LOFF_CONTINUOUS_CONVERSION) && (new_state < LOFF_CONV_MODE_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG4].Current_Value & 0xF7;
    return write_register(CONFIG4, value | (static_cast<uint8_t>(new_state) << 3));
  }
  return false;
}


LOff_Power_Status_t ADS1299_Module::get_LOff_power_status(void)
{
  uint8_t reg_data = read_register(CONFIG4);

  reg_data  &= 0x02;
  reg_data >>= 1;
  switch (reg_data)
  {
  case LOFF_POWER_DISABLED:
    return LOFF_POWER_DISABLED;

  case LOFF_POWER_ENABLED:
    return LOFF_POWER_ENABLED;

  default:
    return LOFF_POWER_ERROR;
  }
}


bool ADS1299_Module::set_LOff_power_status(LOff_Power_Status_t new_state)
{
  if ((new_state >= LOFF_POWER_DISABLED) && (new_state < LOFF_POWER_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG4].Current_Value & 0xFD;
    return write_register(CONFIG4, value | ((static_cast<uint8_t>(new_state)) << 1));
  }
  return false;
}
