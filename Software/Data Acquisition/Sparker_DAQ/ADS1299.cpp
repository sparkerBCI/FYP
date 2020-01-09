/*! ******************************************************************************************
 *  @file ADS1299.cpp
 *
 *  @brief This file holds the ADS1299_Module class function definitions.
 *
 *  All the getters and setters are here. There are also functions to send commands (of type
 *  Command_t) to the device. The functions to write raw data to the registers are private to
 *  try to limit what people can throw at the device (some register bits are reserved, and may
 *  cause *undefined behaviour* if they are changed).
 *
 *  @author Sam Parker
 *
 *  @todo Make the setters get the value from the device before bitbanging
 *
 *  Copyright (c) Sam Parker. 2020. All rights reserved.
 *
 *********************************************************************************************/

#include <SPI.h>

#include "ADS1299.h"

/*! ******************************************************************************************
 * @todo Replace this with a private variable that is set by the get_num_channels function.
 *
 *********************************************************************************************/
#define NUM_CHANNELS    8

/*! ******************************************************************************************
 * @brief Creates an ADS1299_Module and opens the SPI interface over which to communicate.
 *
 *********************************************************************************************/
ADS1299_Module::ADS1299_Module(DAQ_Pin_Map *m_Hardware_Info)
{
  Hardware_Info = m_Hardware_Info;

  /* Set up SPI interface */
  SPI.beginTransaction(SPISettings(Hardware_Info->SPI_SPEED_HZ, Hardware_Info->SPI_ENDIAN, Hardware_Info->SPI_MODE));
}


/*! ******************************************************************************************
 * @brief Gets the current value of a Register from local memory.
 *
 * @todo Remove this function
 *
 * @param[in] Register        - Which register to read from.
 *
 * @return                    - The current value of the Register as stored in the Reg_Array.
 *                              0xFF if error. This isn't great, because if the register
 *                              contains 0xFF it may be interpreted as an error.
 *
 *********************************************************************************************/
uint8_t ADS1299_Module::get_value(Reg_ID_t Register)
{
  if ((Register >= ID) && (Register < NUM_REGS))
  {
    return(Reg_Array[Register].Current_Value);
  }
  return(0xFF);
}


/*! ******************************************************************************************
 * @brief Sets the current value of a Register from local memory.
 *
 * @todo Remove this function
 *
 * @param[in] Register        - Which register to write to.
 * @param[in] new_value       - The new value of this register in memory.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the current value of a Register from the ADS1299 given a Reg_ID.
 *
 * The Read Register command on the ADS1299 is a 16 bit command, asking for the register, and
 * the number of sequential registers to read - 1. Since we only want to read 1 register, the
 * second byte is 0, so we AND the command with 0xFF00 to ensure the lower byte is 0. Updates
 * the value stored in local memory.
 *
 * @param[in] Register        - Which register to read from.
 *
 * @return                    - The current value of the Register from the device.
 *                              0 if error. This isn't great, because if the register
 *                              contains 0 it may be interpreted as an error, so this retval
 *                              shouldn't be considered an error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the current value of a Register from the ADS1299 given a memory address.
 *
 * This overloads read_register. First converts the address to a Reg_ID, then calls
 * read_register with the found Reg_ID, if there was a Reg_ID matching the address.
 *
 * @param[in] Register_Address      - Which register address to read from.
 *
 * @return                          - The current value of the Register from the device.
 *                                    0 if error. This isn't great, because if the register
 *                                    contains 0 it may be interpreted as an error, so this
 *                                    retval shouldn't be considered an error.
 *
 *********************************************************************************************/
uint8_t ADS1299_Module::read_register(int Register_Address)
{
  Reg_ID_t temp_ID = get_Reg_ID_from_Address(Register_Address);

  if (temp_ID != REG_ERROR)
  {
    return read_register(temp_ID);
  }
  return(0);
}


/*! ******************************************************************************************
 * @brief Converts a memory address to a Reg_ID.
 *
 * This function searches through the Reg_Array and returns the Reg_ID of the first register
 * with the provided address.
 *
 * @param[in] register_address      - Which register address to match.
 *
 * @return                          - The Reg_ID of the first register to possess the address
 *                                    provided. REG_ERROR if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Writes data to a register on the ADS1299 given a Reg_ID.
 *
 * There are no checks for what value is, which is why this function should only be used by
 * member functions of this class, and ONLY CALLED AFTER CAREFULLY CHECKING THE DATASHEET TO
 * MAKE SURE THERE AREN'T ANY RESERVED BITS BEING OVERWRITTEN. Also updates the current value
 * in local memory.
 *
 * @param[in] Register              - The register to write to.
 * @param[in] value                 - The value to write to the register.
 *
 * @return                          - True if the command was successfully sent, false
 *                                    otherwise.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Writes data to a register on the ADS1299 given a memory address.
 *
 * This function overloads write_register. First checks to see if there is a register at the
 * address given. If there is, the value is written, otherwise the function returns false.
 * There are no checks for what value is, which is why this function should only be used by
 * member functions of this class, and ONLY CALLED AFTER CAREFULLY CHECKING THE DATASHEET
 * TO MAKE SURE THERE AREN'T ANY RESERVED BITS BEING OVERWRITTEN. Also updates the current
 * value in local memory.
 *
 * @param[in] Register              - The register to write to.
 * @param[in] value                 - The value to write to the register.
 *
 * @return                          - The result of trying to send the value, false
 *                                    otherwise.
 *
 *********************************************************************************************/
bool ADS1299_Module::write_register(int Register_Address, uint8_t value)
{
  Reg_ID_t temp_ID = get_Reg_ID_from_Address(Register_Address);

  if (temp_ID != REG_ERROR)
  {
    return write_register(temp_ID, value);
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Sends a single byte command to the ADS1299.
 *
 * Single byte commands are mostly used for setting device states.
 *
 * @param[in] command               - The command to send to the device.
 *
 * @return                          - True if the command was successfully sent, false
 *                                    otherwise.
 *
 *********************************************************************************************/
bool ADS1299_Module::send_command(Command_t command)
{
  if ((command >= WAKEUP) && (command < RREG))
  {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
    SPI.transfer(command);
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
    return(true);
  }
  return(false);
}


/*! ******************************************************************************************
 * @brief Resets the device and waits the required time.
 *
 * The datasheet calls for a delay of 1.96us after issuing the RESET command, but we wait 1ms
 * just to be safe.
 *
 *********************************************************************************************/
void ADS1299_Module::reset()
{
  send_command(RESET);
  delay(1);
}


/*! ******************************************************************************************
 * @brief Gets the device version from the ADS1299.
 *
 * This value is baked in to the ADS1299 by TI, and the datasheet doesn't give much info about
 * what the value represents, but we can read it!
 *
 * @return                          - The device version.
 *
 *********************************************************************************************/
uint8_t ADS1299_Module::get_device_version(void)
{
  uint8_t id_reg = read_register(ID);

  id_reg  &= 0xE0;                                                                                 /* Isolate the version section */
  id_reg >>= 5;                                                                                    /* Move the version info to bit 0 */
  return(id_reg);
}


/*! ******************************************************************************************
 * @brief Gets the device ID from the ADS1299.
 *
 * If the value is not 0x03, something is wrong. Or check the datasheet, TI may have changed
 * things.
 *
 * @return                          - The device ID (expect 0x03).
 *
 *********************************************************************************************/
uint8_t ADS1299_Module::get_device_id(void)
{
  uint8_t id_reg = read_register(ID);

  id_reg  &= 0x0C;                                                                                 /* Isolate the device ID section */
  id_reg >>= 2;                                                                                    /* Move the device ID to bit 0 */
  return(id_reg);
}


/*! ******************************************************************************************
 * @brief Gets the number of channels from the ADS1299.
 *
 * @return                          - The number of channels (4, 6, or 8). 0 if error.
 *
 * @todo Make this function set a num_channels variable, to be created.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets whether the device is in daisy chain mode or not.
 *
 * @return                          - The current daisy chain mode, or DAISY_MODE_ERROR if
 *                                    error.
 *
 *********************************************************************************************/
Daisy_Chain_Mode_t ADS1299_Module::get_daisy_mode(void)
{
  uint8_t reg_data = read_register(CONFIG1);

  if (!reg_data)                                                                                   /* if read_register failed */
  {
    return(DAISY_MODE_ERROR);
  }
  reg_data &= 0x40;                                                                                /* Isolate the daisy chain section */
  if (!reg_data)
  {
    return DAISY_CHAIN_MODE;
  }
  return MULTIPLE_READBACK_MODE;
}


/*! ******************************************************************************************
 * @brief Sets whether the device is in daisy chain mode or not.
 *
 * @param[in] new_mode              - The new daisy chain state.
 *
 * @return                          - True if the command to change the daisy chain mode was
 *                                    sent successfully, false otherwise. False if invalid
 *                                    mode requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_daisy_mode(Daisy_Chain_Mode_t new_mode)
{
  if ((new_mode >= DAISY_CHAIN_MODE) && (new_mode < DAISY_MODE_ERROR))
  {
    if (new_mode == MULTIPLE_READBACK_MODE)
    {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | 0x40));                    /* Set the 6th bit of the register */
    }
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & 0xBF));                      /* Clear the 6th bit of the register */
  }

  return false;
}


/*! ******************************************************************************************
 * @brief Gets the current clock mode.
 *
 * If clock mode is true, the oscillator will output to the CLK pins if the CLKSEL pin is HIGH.
 *
 * @return                          - True if the oscillator will output on CLK pins if CLKSEL
 *                                    is HIGH. False otherwise. False if read error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the clock mode.
 *
 * If clock mode is true, the oscillator will output to the CLK pins if the CLKSEL pin is HIGH.
 *
 * @param[in] enable                - True if oscillator output is enabled, false otherwise.
 *
 * @return                          - True if the command to change the clock was sent
 *                                    successfully. False otherwise.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the current data rate.
 *
 * The data rate determines how many samples per second the ADS1299 reads at.
 *
 * @return                          - The current data rate. SPS_ERROR if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the current data rate.
 *
 * The data rate determines how many samples per second the ADS1299 reads at.
 *
 * @param[in] new_rate              - The new data rate to sample at.
 *
 * @return                          - True if the command to change the data rate was sent
 *                                    successfully. False otherwise. False if invalid data rate
 *                                    requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets whether the test signal is sourced internally or externally.
 *
 * @return                          - True if the test signals are generated internally. False
 *                                    if the test signals are driven externally.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_int_cal(void)
{
  uint8_t reg_data = read_register(CONFIG2);

  reg_data &= 0x10;
  return(reg_data);
}


/*! ******************************************************************************************
 * @brief Sets whether the test signal is sourced internally or externally.
 *
 * @param[in] state                 - True if the test signals are to be generated internally.
 *                                    False if the test signals are to be driven externally.
 *
 * @return                          - True if the command to set the test signal source was
 *                                    sent successfully. False otherwise.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the amplitude of the test functions.
 *
 * Amplitude will be 1 x -(VREFP - VREFN) / 2400 [corresponds to false] or
 * 2 x -(VREFP - VREFN) / 2400 [corresponds to true].
 *
 * @return                          - True if the amplitude of the test signal is
 *                                    2 x -(VREFP - VREFN) / 2400. False if the amplitude of
 *                                    the test signal is 1 x -(VREFP - VREFN) / 2400.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_cal_amp(void)
{
  uint8_t reg_data = read_register(CONFIG2);

  reg_data &= 0x04;
  return(reg_data);
}


/*! ******************************************************************************************
 * @brief Sets the amplitude of the test functions.
 *
 * Amplitude will be 1 x -(VREFP - VREFN) / 2400 [corresponds to false] or
 * 2 x -(VREFP - VREFN) / 2400 [corresponds to true].
 *
 * @param[in] state                 - The new ampltitude state. True if the amplitude of the
 *                                    test signal is 2 x -(VREFP - VREFN) / 2400. False if the
 *                                    amplitude of the test signal is
 *                                    1 x -(VREFP - VREFN) / 2400.
 *
 * @return                          - True if the command to change the test signal amplitude
 *                                    was sent successfully. False otherwise.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the frequency of the test functions.
 *
 * @return                          - The frequency of the test signal. TEST_FREQ_ERROR if
 *                                    error.
 *
 *********************************************************************************************/
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
    return(TEST_FREQ_ERROR);
  }
}


/*! ******************************************************************************************
 * @brief Sets the frequency of the test functions.
 *
 * Looks to local memory for the current value, and clears the current frequency setting. Then
 * ORs the register value with the new frequency setting. Writes that value to the device.
 *
 * @param[in] new_freq              - The new test signal frequency setting.
 *
 * @return                          - True if the command to change the test signal frequency
 *                                    was sent successfully. False otherwise. False if an
 *                                    invalid frequency setting was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_cal_freq(Test_Frequency_t new_freq)
{
  if ((new_freq >= TEST_FREQ_FCLK_DIV_2_21) && (new_freq < TEST_FREQ_ERROR) && (new_freq != TEST_FREQ_INVALID))
  {
    uint8_t value = Reg_Array[CONFIG2].Current_Value & 0xFC;                                       /* Clear the old data */
    return(write_register(CONFIG2, value | static_cast<uint8_t>(new_freq)));                       /* Set the bits of the CONFIG2 register */
  }
  else
  {
    return(false);                                                                                 /* The requested frequency is invalid */
  }
}


/*! ******************************************************************************************
 * @brief Gets the power state of the internal reference buffer.
 *
 * Unless an external voltage reference is supplied, this should be powered on.
 *
 * @return                          - True if the internal reference buffer is powered on.
 *                                    False if the internal reference buffer is powered off.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_reference_buffer_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x80;
  return(reg_data);
}


/*! ******************************************************************************************
 * @brief Sets the power state of the internal reference buffer.
 *
 * Unless an external voltage reference is supplied, this should be powered on.
 *
 * @param[in]                       - True to power on the internal reference buffer.
 *                                    False to power off the internal reference buffer.
 *
 * @return                          - True if the internal reference buffer is powered on.
 *                                    False if the internal reference buffer is powered off.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets whether the BIAS_IN signal can be measured by appropriately configued channels.
 *
 * If the BIAS_IN state is true, the BIAS signal can be measured by any channel configured
 * as a CH_BIAS_MEAS by the set_channel_connection_type function.
 *
 * @return                          - True if the BIAS signal is routed to the channels.
 *                                    False if the BIAS signal is Open.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_bias_measurement_state(void)
{
  uint8_t reg_data = read_register(CONFIG3);

  reg_data &= 0x10;
  return(reg_data);
}


/*! ******************************************************************************************
 * @brief Sets whether the BIAS_IN signal can be measured by appropriately configued channels.
 *
 * If the BIAS_IN state is true, the BIAS signal can be measured by any channel configured
 * as a CH_BIAS_MEAS by the set_channel_connection_type function.
 *
 * @param[in] new_state             - True if the BIAS signal is routed to the channels.
 *                                    False if the BIAS signal is Open.
 *
 * @return                          - True if the command to change the BIAS routing was sent
 *                                    successfully, false otherwise.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets whether the BIAS_REF signal is fed externally or is generated internally at a
 * mid-supply level (i.e. (AVDD + AVSS) / 2).
 *
 * If a BIAS_REF electrode is being used, this should be set to BIAS_EXTERNAL.
 *
 * @return                          - The bias signal source. BIAS_ERROR if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets whether the BIAS_REF signal is fed externally or is generated internally at a
 * mid-supply level (i.e. (AVDD + AVSS) / 2).
 *
 * If a BIAS_REF electrode is being used, this should be set to BIAS_EXTERNAL.
 *
 * @param[in] new_source            - The new source of the BIAS signal.
 *
 * @return                          - True if the command to set the new BIAS source as sent
 *                                    successfully. False otherwise. False if an invalid
 *                                    source was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_bias_source(Bias_Source_t new_source)
{
  if ((new_source >= BIAS_INTERNAL) && (new_source < BIAS_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG3].Current_Value & 0xF7;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_source)) << 3));
  }

  return false;
}


/*! ******************************************************************************************
 * @brief Gets the current BIAS buffer state.
 *
 * @return                          - The current BIAS buffer state. BIAS_POWER_ERROR if error
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the current BIAS buffer state.
 *
 * If there is no subject biasing or right-leg-drive this can be powered off to save power.
 *
 * @param[in] new_state             - The power state to set the BIAS buffer to.
 *
 * @return                          - True if the command to set the new power state was sent
 *                                    successfully. False otherwise. False if an invalid power
 *                                    state is requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_bias_power_state(Bias_Power_State_t new_state)
{
  if ((new_state >= BIAS_POWER_OFF) && (new_state < BIAS_POWER_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG3].Current_Value & 0xFB;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_state)) << 2));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets the status of the bias sense function.
 *
 * @return                          - The state of the bias sense function. BIAS_SENSE_ERROR
 *                                    if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Enables or disables the bias sense function.
 *
 * @param[in] new_state             - The new state to set, enabling or disabling the bias
 *                                    sense function.
 *
 * @return                          - True if the command to change the status of the bias
 *                                    sense function was sent successfully. False otherwise.
 *                                    False if an invalid state was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_bias_sense_state(Bias_Sense_Enable_t new_state)
{
  if ((new_state >= BIAS_SENSE_DISABLED) && (new_state < BIAS_SENSE_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG3].Current_Value & 0xFD;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_state)) << 1));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets whether the BIAS lead is attached.
 *
 * @return                          - The status of the BIAS lead. BIAS_LOFF_ERROR if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the leadoff comparator threshold level.
 *
 * On the positive side, threshold will be 100% - return value. On the negative side,
 * threshold is return value.
 *
 * @return                          - The leadoff comparator threshold level.
 *                                    LOFF_THRESH_ERROR if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the leadoff comparator threshold level.
 *
 * On the positive side, threshold will be 100% - new_thresh. On the negative side, threshold
 * is new_thresh.
 *
 * @param[in] new_thresh            - The new threshold level to set.
 *
 * @return                          - True if the command to change the leadoff comparator
 *                                    threshold was sent successfully. False otherwise. False
 *                                    if an invalid threshold was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_lead_off_comp_thresh(LOff_Comp_Threshold_Var_t new_thresh)
{
  if ((new_thresh >= LOFF_5Per) && (new_thresh < LOFF_THRESH_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & 0x1F;
    return write_register(LOFF, value | ((static_cast<uint8_t>(new_thresh)) << 5));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets the lead-off current (like Amps) magnitude.
 *
 * @return                          - The lead-off current level. LOFF_CURRENT_ERROR if error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the lead-off current (like Amps) magnitude.
 *
 * @param[in] new_current           - The new current level for the lead-off detection.
 *
 * @return                          - True if the command to change the current level was sent
 *                                    successfully. False otherwise. False if an invalid
 *                                    current level was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_lead_off_current_mag(LOff_Current_t new_current)
{
  if ((new_current >= LOFF_CURRENT_6nA) && (new_current < LOFF_CURRENT_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & 0xF3;
    return write_register(LOFF, value | ((static_cast<uint8_t>(new_current)) << 2));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets the lead-off detection frequency.
 *
 * This is the rate that the leads are polled to see if they have disconnected.
 * LOFF_FREQ_SPS_OVER_4 means the leads will be sampled at 1 quarter of the data rate.
 *
 * @return                          - The lead-off detection frequency. LOFF_FREQ_ERROR if
 *                                    error.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the lead-off detection frequency.
 *
 * This is the rate that the leads are polled to see if they have disconnected.
 * LOFF_FREQ_SPS_OVER_4 means the leads will be sampled at 1 quarter of the data rate.
 *
 * @param[in] new_freq              - The new lead-off detection frequency.
 *
 * @return                          - True if the command to change the lead off detection
 *                                    frequency was sent successfully. False otherwise. False
 *                                    if an invalid frequency was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_lead_off_frequency(LOff_Freq_t new_freq)
{
  if ((new_freq >= LOFF_FREQ_DC) && (new_freq < LOFF_FREQ_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & 0xFC;
    return write_register(LOFF, value | (static_cast<uint8_t>(new_freq)));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets the power state of the requested channel.
 *
 * If the channel is powered down, TI recommends the channel is shorted. This can be achieved
 * using the get_channel_connection_type function.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    register.
 *
 * @return                          - The channel power state of the requested channel.
 *                                    CH_POWER_ERROR if error. CH_POWER_ERROR if an invalid
 *                                    channel is requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the power state of the requested channel.
 *
 * If the channel is powered down, TI recommends the channel is shorted. This can be achieved
 * using the get_channel_connection_type function.
 *
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    register.
 * @param[in] new_state             - The power state to set this channel to.
 *
 * @return                          - True if the command to set the power state was sent
 *                                    successfully. False otherwise. False if an invalid
 *                                    channel or power state was requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Gets the Programmable Gain Array gain setting of the requested channel.
 *
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    register.
 *
 * @return                          - The gain setting associated with this channel. PGA_ERROR
 *                                    if error. PGA_ERROR if an invalid channel is requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the Programmable Gain Array gain setting of the requested channel.
 *
 *
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    register.
 * @param[in] new_state             - The gain level to set for the given channel.
 *
 * @return                          - True if the command to change the gain setting was sent
 *                                    successfully. False otherwise. False if an invalid
 *                                    channel or gain setting was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_channel_gain(Channel_t channel, Gain_Setting_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= PGA1) && (new_state < PGA_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0x8F;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << 4));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets the SRB2 connection status of the channel.
 *
 * SRB2 is the secondary reference channel. For a referential montage, application notes from
 * TI use SRB1, which can be set en masse using set_all_channel_SRB1_connection_status.
 *
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    register.
 *
 * @return                          - The SRB2 connection status of the requested channel.
 *                                    SRB2_ERROR if error or an invalid channel is requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the SRB2 connection status of the channel.
 *
 * SRB2 is the secondary reference channel. For a referential montage, application notes from
 * TI use SRB1, which can be set en masse using set_all_channel_SRB1_connection_status.
 *
 *
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    register.
 * @param[in] new_state             - The connection status for this channel.
 *
 * @return                          - True if the command to change the SRB2 connection status
 *                                    of this channel was sent successfully. False otherwise.
 *                                    False if an invalid channel or connection state is
 *                                    requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_channel_SRB2_connection_status(Channel_t channel, SRB2_Connection_Status_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= SRB2_OPEN) && (new_state < SRB2_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0xF7;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << 3));
  }

  return false;
}


/*! ******************************************************************************************
 * @brief Gets info about the channel connection type.
 *
 * Channels can be electrodes, shorted to AVDD (off), bias measurements, mid-supply, temp
 * sensors, test signals, positive side bias drivers, or negative side bias drivers.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    register.
 *
 * @return                          - The channel connection configuration.
 *                                    CH_CONNECTION_ERROR if error. CH_CONNECTION_ERROR if an
 *                                    invalid channel is requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets info about the channel connection type.
 *
 * Channels can be electrodes, shorted to AVDD (off), bias measurements, mid-supply, temp
 * sensors, test signals, positive side bias drivers, or negative side bias drivers.
 *
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    register.
 * @param[in] new_state             - The new connection configuration for this channel.
 *
 * @return                          - True if the command to change the connection config was
 *                                    sent successfully. False otherwise. False if an invalid
 *                                    channel or connection type was requested.
 *
 *********************************************************************************************/
bool ADS1299_Module::set_channel_connection_type(Channel_t channel, Channel_Connection_Type_t new_state)
{
  if ((channel >= CH1) && (channel < NUM_CHANNELS) && (new_state >= CH_ELECTRODE_INPUT) && (new_state < CH_CONNECTION_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & 0xF8;
    return write_register(Reg_Array[CH1SET].Address + channel, value | (static_cast<uint8_t>(new_state)));
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Gets info from a bit-addressable register.
 *
 * There are several registers where each bit corresponds to a channel. All of these can be
 * interfaced in the same way. In this function, given a register and a channel, the correct
 * bit from the correct register can be found. On ADS1299-4 or ADS1299-6 devices, not all
 * bits are available. This function will stop before reaching those (if num_channels is at its
 * default value it will query the device for how many channels it has).
 *
 * @todo if num_channels has some initial value (i.e. not 4, 6 or 8, maybe 0?), run get_num
 * _channels to determine the number of channels here.
 *
 * @param[in] Register              - The Reg_ID of the register we are looking at.
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - The value of the bit. False if a invalid channel (i.e.
 *                                    bit) or register is requested.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets a bit-addressable register.
 *
 * There are several registers where each bit corresponds to a channel. All of these can be
 * interfaced in the same way. In this function, given a register and a channel, the correct
 * bit from the correct register can be set. Here, if we are setting a bit, the bitmask starts
 * at 0x01 for channel 1, then moves left for each channel up we are looking at. This works
 * because when we bitshift, the new bits are set to 0. But when we're clearing a bit, we want
 * the new bits to be 1. To get this done, we fill the shifted bits with
 * ((0x01 << channel) - 1). This follows 0, 1, 3, 7, ... 127.
 *
 * @param[in] Register              - The Reg_ID of the register we are looking at.
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    bit.
 * @param[in] new_state             - The new state to set the bit to.
 *
 * @return                          - The value of the bit. False if a invalid channel (i.e.
 *                                    bit) or register is requested.
 *
 *********************************************************************************************/
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
      uint8_t bitmask = (0xFE << channel) | ((0x01 << channel) - 1);
      return write_register(Register, Reg_Array[Register].Current_Value & bitmask);
    }
  }
  return false;
}


/*! ******************************************************************************************
 * @brief Sets the bias drive positive derivation.
 *
 * This selects if any channels' positive signal is used for the bias voltage signal.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel is set to be a bias drive channel.
 *
 *********************************************************************************************/
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
