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
 *  Copyright (c) Sam Parker 2020 <br/> All rights reserved.
 *
 *********************************************************************************************/

#include <SPI.h>

#include "ADS1299.h"

/*! ******************************************************************************************
 *  @brief Creates an ADS1299_Module and opens the SPI interface over which to communicate.
 *
 *  @param[in] Hardware_Info            - A Hardware Map so the module knows which pin to pull
 *                                        LOW to initiate a SPI transfer, which pin is START,
 *                                        etc.
 *
 *********************************************************************************************/
ADS1299_Module::ADS1299_Module(DAQ_Pin_Map *m_Hardware_Info)
{
  Hardware_Info = m_Hardware_Info;

  /* Set up SPI interface */
  SPCR |= _BV(MSTR);
  SPCR |= _BV(SPE);

  /* Set Clock Divider */
  SPCR = (SPCR & ~SPI_CLOCK_MASK) | (SPI_CLOCK_DIV16 & SPI_CLOCK_MASK);        /* Divides 16MHz clock by 16 to set CLK speed to 1MHz */
  SPSR = (SPSR & ~SPI_2XCLOCK_MASK) | ((SPI_CLOCK_DIV16 >> 2) & SPI_2XCLOCK_MASK); /* Divides 16MHz clock by 16 to set CLK speed to 1MHz */

  /* Set Data Mode */
  SPCR = (SPCR & ~SPI_MODE_MASK) | SPI_DATA_MODE;                              /* Clock polarity = 0; clock phase = 1 (pg. 8) */

  /* Set Bit Order */
  SPCR &= ~(_BV(DORD));                                                        /* SPI data format is MSB (pg. 25) */

//#ifndef NO_SPI
//  /* Configure the ADC for the recording montage */
//  reset();                                                                     /* Reset device */
//  send_command(SDATAC);                                                        /* Device defaults to continuous recording mode */
//
//  number_of_channels = get_num_channels_from_device();
//#endif
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
  if ((Register >= ID) && (Register < NUM_REGS))                               /* If the register address is valid */
  {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);          /* Address the ADS1299 */
    transfer(RREG | Reg_Array[Register].Address);                              /* Format the Read Register Command as 001r rrrr where r is the register address */
    transfer(0x00);                                                            /* We only want 1 byte, so no second byte info is needed */
    uint8_t result = transfer(0x00);                                           /* Pulse SCLK to read a byte from the ADS1299 */
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);         /* Bring CS HIGH */
    Reg_Array[Register].Current_Value = result;                                /* Save the current value of this register */
    return(result);                                                            /* Return what we got from the ADS1299 */
  }
  return(0);                                                                   /* Otherwise, return 0 */
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
uint8_t ADS1299_Module::read_register_from_address(int Register_Address)
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::write_register(Reg_ID_t Register, uint8_t value)
{
  if ((Register >= ID) && (Register < NUM_REGS) && !(Reg_Array[Register].Read_Only)) /* If the register exists and is not read only */
  {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);          /* Address the ADS1299 */
    transfer(WREG | Reg_Array[Register].Address);                              /* Format the Write to Register command as 010r rrrr where r is the register address */
    transfer(0x00);                                                            /* We are writing to 1 register */
    transfer(value);                                                           /* Write the new value to the regsiter */
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);         /* Stop talking to the ADS1299 */
    Reg_Array[Register].Current_Value = value;                                 /* Update the current value in memory */
    return(ADS1299_SUCCESS);                                                   /* Success, return */
  }
  return(ADS1299_COMMS_ERROR);                                                 /* Otherwise, the register was invalid */
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::write_register_at_address(int Register_Address, uint8_t value)
{
  Reg_ID_t temp_ID = get_Reg_ID_from_Address(Register_Address);

  if (temp_ID != REG_ERROR)
  {
    return write_register(temp_ID, value);
  }
  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Sends a single byte command to the ADS1299.
 *
 * Single byte commands are mostly used for setting device states.
 *
 * @param[in] command               - The command to send to the device.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::send_command(Command_t command)
{
  if ((command >= WAKEUP) && (command < RREG))
  {
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
    transfer(command);
    digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);

    if (command == START)
    {
      is_running = true;
      delay(1);
    }
    else if (command == STOP)
    {
      is_running = false;
      delay(1);
    }
    return(ADS1299_SUCCESS);
  }
  return(ADS1299_COMMS_ERROR);
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
  delay(10);
  delay(18.0 * TCLK_PERIOD_MS);

  for (int this_reg = ID; this_reg < NUM_REGS; this_reg++)                     /* Until we have looked at every register */
  {
    Reg_Array[this_reg].Current_Value = Reg_Array[this_reg].Value_on_Reset;    /* Reset its saved value back to the default */
  }
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

  id_reg  &= Param_Array[BITMSK_REV_ID].Bitmask;                               /* Isolate the version section */
  id_reg >>= Param_Array[BITMSK_REV_ID].Shifts;                                /* Move the version info to bit 0 */
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

  id_reg  &= Param_Array[BITMSK_DEV_ID].Bitmask;                               /* Isolate the device ID section */
  id_reg >>= Param_Array[BITMSK_DEV_ID].Shifts;                                /* Move the device ID to bit 0 */
  return(id_reg);
}


/*! ******************************************************************************************
 * @brief Gets the number of channels from the ADS1299.
 *
 * @return                          - The number of channels. NUM_CHANNELS_ERROR if error.
 *
 *********************************************************************************************/
Num_Channels_t ADS1299_Module::get_num_channels_from_device(void)
{
  uint8_t id_reg = read_register(ID);

  if (!id_reg)                                                                 /* if read_register failed */
  {
    return(NUM_CHANNELS_ERROR);
  }
  id_reg  &= Param_Array[BITMSK_NUM_CH].Bitmask;                               /* Isolate the num channels section */
  id_reg >>= Param_Array[BITMSK_NUM_CH].Shifts;
  switch (id_reg)
  {
  case NUM_CHANNELS_4:
    return NUM_CHANNELS_4;

  case NUM_CHANNELS_6:
    return NUM_CHANNELS_6;

  case NUM_CHANNELS_8:
    return NUM_CHANNELS_8;

  default:
    return NUM_CHANNELS_ERROR;
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

  if (!reg_data)                                                               /* if read_register failed */
  {
    return(DAISY_MODE_ERROR);
  }
  reg_data &= Param_Array[BITMSK_DAISY_EN].Bitmask;                            /* Isolate the daisy chain section */
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_daisy_mode(Daisy_Chain_Mode_t new_mode)
{
  if ((new_mode >= DAISY_CHAIN_MODE) && (new_mode < DAISY_MODE_ERROR))
  {
    if (new_mode == get_daisy_mode())
    {
      return ADS1299_SUCCESS;
    }
    if (new_mode == MULTIPLE_READBACK_MODE)
    {
      return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | Param_Array[BITMSK_DAISY_EN].Bitmask)); /* Set the 6th bit of the register */
    }
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & (~Param_Array[BITMSK_DAISY_EN].Bitmask))); /* Clear the 6th bit of the register */
  }

  return ADS1299_INVALID;
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

  if (!reg_data)                                                               /* if read_register failed */
  {
    return(false);
  }
  reg_data &= Param_Array[BITMSK_CLK_EN].Bitmask;                              /* Isolate the clock mode section */
  return(reg_data);                                                            /* Reg data will contain a non-zero (0x20) if oscillator output connected to CLK pins, else 0 */
}


/*! ******************************************************************************************
 * @brief Sets the clock mode.
 *
 * If clock mode is true, the oscillator will output to the CLK pins if the CLKSEL pin is HIGH.
 *
 * @param[in] enable                - True if oscillator output is enabled, false otherwise.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_clock_mode(bool enable)
{
  if (enable == get_clock_mode())
  {
    return ADS1299_SUCCESS;
  }
  if (enable)
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value | Param_Array[BITMSK_CLK_EN].Bitmask)); /* Set the 5th bit of the register */
  }
  else
  {
    return(write_register(CONFIG1, Reg_Array[CONFIG1].Current_Value & (~Param_Array[BITMSK_CLK_EN].Bitmask))); /* Clear the 5th bit of the register */
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

  if (!reg_data)                                                               /* if read_register failed */
  {
    return(SPS_ERROR);
  }
  reg_data  &= Param_Array[BITMSK_DATA_RATE].Bitmask;                          /* Isolate the clock mode section */
  reg_data >>= Param_Array[BITMSK_DATA_RATE].Shifts;

  if ((reg_data == SPS16k) ||
      (reg_data == SPS8k) ||
      (reg_data == SPS4k) ||
      (reg_data == SPS2k) ||
      (reg_data == SPS500) ||
      (reg_data == SPS250))
  {
    return reg_data;
  }
  return SPS_ERROR;
}


/*! ******************************************************************************************
 * @brief Sets the current data rate.
 *
 * The data rate determines how many samples per second the ADS1299 reads at.
 *
 * @param[in] new_rate              - The new data rate to sample at.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_data_rate(Data_Rate_Setting_t new_rate)
{
  if (new_rate == get_data_rate())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_rate >= SPS16k) && (new_rate < SPS_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG1].Current_Value & (~Param_Array[BITMSK_DATA_RATE].Bitmask); /* Clear the old data */
    return(write_register(CONFIG1, value | new_rate));                         /* Write the new data rate */
  }
  else
  {
    return(ADS1299_INVALID);                                                   /* The requested rate is invalid */
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

  reg_data &= Param_Array[BITMSK_INT_CAL].Bitmask;
  return(reg_data);
}


/*! ******************************************************************************************
 * @brief Sets whether the test signal is sourced internally or externally.
 *
 * @param[in] state                 - True if the test signals are to be generated internally.
 *                                    False if the test signals are to be driven externally.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_int_cal(bool state)
{
  if (state == get_int_cal())
  {
    return ADS1299_SUCCESS;
  }
  if (state)
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | Param_Array[BITMSK_INT_CAL].Bitmask)); /* Set the 4th bit of the CONFIG2 register */
  }
  else
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & ~Param_Array[BITMSK_INT_CAL].Bitmask)); /* Clear the 4th bit of the CONFIG2 register */
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

  reg_data &= Param_Array[BITMSK_CAL_AMP].Bitmask;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_cal_amp(bool state)
{
  if (state == get_cal_amp())
  {
    return ADS1299_SUCCESS;
  }
  if (state)
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value | Param_Array[BITMSK_CAL_AMP].Bitmask)); /* Set the 2nd bit of the CONFIG2 register */
  }
  else
  {
    return(write_register(CONFIG2, Reg_Array[CONFIG2].Current_Value & ~Param_Array[BITMSK_CAL_AMP].Bitmask)); /* Clear the 2nd bit of the CONFIG2 register */
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

  reg_data  &= Param_Array[BITMSK_CAL_FREQ].Bitmask;
  reg_data >>= Param_Array[BITMSK_CAL_FREQ].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_cal_freq(Test_Frequency_t new_freq)
{
  if (new_freq == get_cal_freq())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_freq >= TEST_FREQ_FCLK_DIV_2_21) && (new_freq < TEST_FREQ_ERROR) && (new_freq != TEST_FREQ_INVALID))
  {
    uint8_t value = Reg_Array[CONFIG2].Current_Value & ~Param_Array[BITMSK_CAL_FREQ].Bitmask; /* Clear the old data */
    return(write_register(CONFIG2, value | static_cast<uint8_t>(new_freq)));   /* Set the bits of the CONFIG2 register */
  }
  else
  {
    return(ADS1299_INVALID);                                                   /* The requested frequency is invalid */
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

  reg_data &= Param_Array[BITMSK_PD_REFBUF].Bitmask;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_reference_buffer_state(bool new_state)
{
  if (new_state == get_reference_buffer_state())
  {
    return ADS1299_SUCCESS;
  }
  if (new_state)
  {
    return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | Param_Array[BITMSK_PD_REFBUF].Bitmask));
  }
  else
  {
    return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value & ~Param_Array[BITMSK_PD_REFBUF].Bitmask));
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

  reg_data &= Param_Array[BITMSK_BIAS_MEAS].Bitmask;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_bias_measurement_state(bool new_state)
{
  if (new_state == get_bias_measurement_state())
  {
    return ADS1299_SUCCESS;
  }
  if (new_state)
  {
    return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value | Param_Array[BITMSK_BIAS_MEAS].Bitmask));
  }
  else
  {
    return(write_register(CONFIG3, Reg_Array[CONFIG3].Current_Value & ~Param_Array[BITMSK_BIAS_MEAS].Bitmask));
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

  reg_data  &= Param_Array[BITMSK_BIASREF_INT].Bitmask;
  reg_data >>= Param_Array[BITMSK_BIASREF_INT].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_bias_source(Bias_Source_t new_source)
{
  if (new_source == get_bias_source())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_source >= BIAS_INTERNAL) && (new_source < BIAS_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG3].Current_Value & ~Param_Array[BITMSK_BIASREF_INT].Bitmask;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_source)) << Param_Array[BITMSK_BIASREF_INT].Shifts));
  }

  return ADS1299_INVALID;
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

  reg_data  &= Param_Array[BITMSK_PD_BIAS].Bitmask;
  reg_data >>= Param_Array[BITMSK_PD_BIAS].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_bias_buffer_power_state(Bias_Power_State_t new_state)
{
  if (new_state == get_bias_buffer_power_state())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_state >= BIAS_POWER_OFF) && (new_state < BIAS_POWER_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG3].Current_Value & !Param_Array[BITMSK_PD_BIAS].Bitmask;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_state)) << Param_Array[BITMSK_PD_BIAS].Shifts));
  }
  return ADS1299_INVALID;
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

  reg_data  &= Param_Array[BITMSK_BIAS_LOFF_SENS].Bitmask;
  reg_data >>= Param_Array[BITMSK_BIAS_LOFF_SENS].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_bias_sense_state(Bias_Sense_Enable_t new_state)
{
  if (new_state == get_bias_sense_state())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_state >= BIAS_SENSE_DISABLED) && (new_state < BIAS_SENSE_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG3].Current_Value & ~Param_Array[BITMSK_BIAS_LOFF_SENS].Bitmask;
    return write_register(CONFIG3, value | ((static_cast<uint8_t>(new_state)) << Param_Array[BITMSK_BIAS_LOFF_SENS].Shifts));
  }
  return ADS1299_INVALID;
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

  reg_data &= Param_Array[BITMSK_BIAS_STAT].Bitmask;
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

  reg_data  &= Param_Array[BITMSK_COMP_THRESH].Bitmask;
  reg_data >>= Param_Array[BITMSK_COMP_THRESH].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_lead_off_comp_thresh(LOff_Comp_Threshold_Var_t new_thresh)
{
  if (new_thresh == get_lead_off_comp_thresh())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_thresh >= LOFF_5Per) && (new_thresh < LOFF_THRESH_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & ~Param_Array[BITMSK_COMP_THRESH].Bitmask;
    return write_register(LOFF, value | ((static_cast<uint8_t>(new_thresh)) << Param_Array[BITMSK_COMP_THRESH].Shifts));
  }
  return ADS1299_INVALID;
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

  reg_data  &= Param_Array[BITMSK_ILEAD_OFF].Bitmask;
  reg_data >>= Param_Array[BITMSK_ILEAD_OFF].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_lead_off_current_mag(LOff_Current_t new_current)
{
  if (new_current == get_lead_off_current_mag())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_current >= LOFF_CURRENT_6nA) && (new_current < LOFF_CURRENT_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & ~Param_Array[BITMSK_ILEAD_OFF].Bitmask;
    return write_register(LOFF, value | ((static_cast<uint8_t>(new_current)) << Param_Array[BITMSK_ILEAD_OFF].Shifts));
  }
  return ADS1299_INVALID;
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

  reg_data &= Param_Array[BITMSK_FLEAD_OFF].Bitmask;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_lead_off_frequency(LOff_Freq_t new_freq)
{
  if (new_freq == get_lead_off_frequency())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_freq >= LOFF_FREQ_DC) && (new_freq < LOFF_FREQ_ERROR))
  {
    uint8_t value = Reg_Array[LOFF].Current_Value & ~Param_Array[BITMSK_FLEAD_OFF].Bitmask;
    return write_register(LOFF, value | (static_cast<uint8_t>(new_freq)));
  }
  return ADS1299_INVALID;
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
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data  &= Param_Array[BITMSK_PDx].Bitmask;
    reg_data >>= Param_Array[BITMSK_PDx].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_power_state(Channel_t channel, Channel_Power_State_t new_state)
{
  if (new_state == get_channel_power_state(channel))
  {
    return ADS1299_SUCCESS;
  }
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels) && (new_state >= CH_POWER_ON) && (new_state < CH_POWER_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & ~Param_Array[BITMSK_PDx].Bitmask;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << Param_Array[BITMSK_PDx].Shifts));
  }
  else
  {
    return ADS1299_INVALID;
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
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data  &= Param_Array[BITMSK_GAINx].Bitmask;
    reg_data >>= Param_Array[BITMSK_GAINx].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_gain(Channel_t channel, Gain_Setting_t new_state)
{
  if (new_state == get_channel_gain(channel))
  {
    return ADS1299_SUCCESS;
  }
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels) && (new_state >= PGA1) && (new_state < PGA_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & ~Param_Array[BITMSK_GAINx].Bitmask;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << Param_Array[BITMSK_GAINx].Shifts));
  }
  return ADS1299_INVALID;
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
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data  &= Param_Array[BITMSK_SRB2].Bitmask;
    reg_data >>= Param_Array[BITMSK_SRB2].Shifts;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_SRB2_connection_status(Channel_t channel, SRB2_Connection_Status_t new_state)
{
  if (new_state == get_channel_SRB2_connection_status(channel))
  {
    return ADS1299_SUCCESS;
  }
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels) && (new_state >= SRB2_OPEN) && (new_state < SRB2_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & ~Param_Array[BITMSK_SRB2].Bitmask;
    return write_register(Reg_Array[CH1SET].Address + channel, value | ((static_cast<uint8_t>(new_state)) << Param_Array[BITMSK_SRB2].Shifts));
  }

  return ADS1299_INVALID;
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
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels))
  {
    uint8_t reg_data = read_register(Reg_Array[CH1SET].Address + channel);
    reg_data &= Param_Array[BITMSK_MUXx].Bitmask;
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
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_connection_type(Channel_t channel, Channel_Connection_Type_t new_state)
{
  if (new_state == get_channel_connection_type(channel))
  {
    return ADS1299_SUCCESS;
  }
  if ((channel >= CH1) && ((uint8_t)channel < (uint8_t)number_of_channels) && (new_state >= CH_ELECTRODE_INPUT) && (new_state < CH_CONNECTION_ERROR))
  {
    uint8_t value = Reg_Array[CH1SET + channel].Current_Value & ~Param_Array[BITMSK_MUXx].Bitmask;
    return write_register(Reg_Array[CH1SET].Address + channel, value | (static_cast<uint8_t>(new_state)));
  }
  return ADS1299_INVALID;
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
  if ((channel >= CH1) &&
      ((uint8_t)channel < (uint8_t)number_of_channels) &&
      (Register >= ID) &&
      (Register < NUM_REGS) &&
      (Reg_Array[Register].Bit_Per_Channel) &&
      (Reg_Array[Register].Read_Only))
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
 * the new bits to be 1. To achieve this, the bitmask is still calculated the same way, but
 * it is then inverted, so the bit where the 1 was is now 0 and everything else is 1.
 *
 * @param[in] Register              - The Reg_ID of the register we are looking at.
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    bit.
 * @param[in] new_state             - The new state to set the bit to.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel, bool new_state)
{
  if (new_state == get_bit_addressable_channel_info(Register, channel))
  {
    return ADS1299_SUCCESS;
  }
  if ((channel >= CH1) &&
      ((uint8_t)channel < (uint8_t)number_of_channels) &&
      (Register >= ID) &&
      (Register < NUM_REGS) &&
      (Reg_Array[Register].Bit_Per_Channel) &&
      (Reg_Array[Register].Read_Only))
  {
    uint8_t bitmask = 0x01 << channel;
    if (new_state)
    {
      return write_register(Register, Reg_Array[Register].Current_Value | bitmask);
    }
    bitmask = ~bitmask;                                                        /* Turns the shifted 1 we created earlier into a shifted 0 surrounded by 1s */
    return write_register(Register, Reg_Array[Register].Current_Value & bitmask);
  }
  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Gets if the provided channel's positive signal is used for the bias positive voltage
 * signal.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel is set to be a bias drive channel.
 *                                    False otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_bias_drive_pos_derivation(Channel_t channel)
{
  return get_bit_addressable_channel_info(BIAS_SENSP, channel);
}


/*! ******************************************************************************************
 * @brief Sets if the provided channel's positive signal is used for the bias positive voltage
 * signal.
 *
 * @param[in] channel               - The channel to connect to the positive bias voltage
 *                                    signal. This is used to select the correct bit.
 * @param[in] new_state             - True if the channel's positive signal is a positive
 *                                    bias voltage driver.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_bias_drive_pos_derivation(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(BIAS_SENSP, channel, new_state);
}


/*! ******************************************************************************************
 * @brief Gets if the provided channel's negative signal is used for the bias negative voltage
 * signal.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel is set to be a bias drive channel.
 *                                    False otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_bias_drive_neg_derivation(Channel_t channel)
{
  return get_bit_addressable_channel_info(BIAS_SENSN, channel);
}


/*! ******************************************************************************************
 * @brief Sets if the provided channel's negative signal is used for the bias negative voltage
 * signal.
 *
 * @param[in] channel               - The channel to connect to the positive bias voltage
 *                                    signal. This is used to select the correct bit.
 * @param[in] new_state             - True if the channel's negative signal is a negative
 *                                    bias voltage driver.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_bias_drive_neg_derivation(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(BIAS_SENSN, channel, new_state);
}


/*! ******************************************************************************************
 * @brief Gets whether a channel's positive lead has lead-off detection enabled.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel's positive lead has lead-off
 *                                    detection enabled. False otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_LOff_pos_enabled(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_SENSP, channel);
}


/*! ******************************************************************************************
 * @brief Sets whether a channel's positive lead has lead-off detection enabled.
 *
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    bit.
 * @param[in] new_state             - The new positive signal lead-off detection state.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_LOff_pos_enabled(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(LOFF_SENSP, channel, new_state);
}


/*! ******************************************************************************************
 * @brief Gets whether a channel's negative lead has lead-off detection enabled.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel's negative lead has lead-off
 *                                    detection enabled. False otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_LOff_neg_enabled(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_SENSN, channel);
}


/*! ******************************************************************************************
 * @brief Sets whether a channel's negative lead has lead-off detection enabled.
 *
 * @param[in] channel               - The channel to set. This is used to select the correct
 *                                    bit.
 * @param[in] new_state             - The new negative signal lead-off detection state.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_LOff_neg_enabled(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(LOFF_SENSN, channel, new_state);
}


/*! ******************************************************************************************
 * @brief Gets whether a channel's lead-off detection pull-X configuration is flipped.
 *
 * If no flip, a channel's positive signal is pulled up to AVDD and negative is pulled down
 * to AVSS. If there is a flip, the channel's positive signal is pulled down to AVSS and its
 * negative channel is pulled up to AVDD.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel's lead-off pull-X configuration is
 *                                    flipped. False otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_LOff_flip_enabled(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_FLIP, channel);
}


/*! ******************************************************************************************
 * @brief Sets whether a channel's lead-off detection pull-X configuration is flipped.
 *
 * If no flip, a channel's positive signal is pulled up to AVDD and negative is pulled down
 * to AVSS. If there is a flip, the channel's positive signal is pulled down to AVSS and its
 * negative channel is pulled up to AVDD.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_channel_LOff_flip_enabled(Channel_t channel, bool new_state)
{
  return set_bit_addressable_channel_info(LOFF_FLIP, channel, new_state);
}


/*! ******************************************************************************************
 * @brief Gets the lead-off status of the positive lead of a channel.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel's positive lead is off. False
 *                                    otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_LOff_pos(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_STATP, channel);
}


/*! ******************************************************************************************
 * @brief Gets the lead-off status of the negative lead of a channel.
 *
 * @param[in] channel               - The channel to check. This is used to select the correct
 *                                    bit.
 *
 * @return                          - True if the channel's negative lead is off. False
 *                                    otherwise. False if error.
 *
 *********************************************************************************************/
bool ADS1299_Module::get_channel_LOff_neg(Channel_t channel)
{
  return get_bit_addressable_channel_info(LOFF_STATN, channel);
}


/*! ******************************************************************************************
 * @brief Gets the GPIO mode of a GPIO Pin.
 *
 * GPIO modes are Input or Output.
 *
 * @param[in] pin                   - The GPIO pin to check.
 *
 * @return                          - The GPIO mode of the supplied pin.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the GPIO mode of a GPIO Pin.
 *
 * GPIO modes are Input or Output.
 *
 * @param[in] pin                   - The GPIO pin to set.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_GPIO_Pin_Mode(GPIO_Pin_t pin, GPIO_Mode_t mode)
{
  if (mode == get_GPIO_Pin_Mode(pin))
  {
    return ADS1299_SUCCESS;
  }
  if ((pin >= GPIO1) && (pin < GPIO_ERROR) && (mode >= GPIO_OUTPUT) && (mode < GPIO_MODE_ERROR))
  {
    uint8_t bitmask = 0x01 << pin;
    if (mode)
    {
      return write_register(GPIO, Reg_Array[GPIO].Current_Value | bitmask);
    }
    bitmask = !bitmask;
    return write_register(GPIO, Reg_Array[GPIO].Current_Value & bitmask);
  }

  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Gets the GPIO state of a GPIO Pin.
 *
 * GPIO states are HIGH or LOW.
 *
 * @param[in] pin                   - The GPIO pin to check.
 *
 * @return                          - The GPIO state of the supplied pin.
 *
 *********************************************************************************************/
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


/*! ******************************************************************************************
 * @brief Sets the GPIO state of a GPIO Pin.
 *
 * GPIO states are HIGH or LOW.
 *
 * @param[in] pin                   - The GPIO pin to set.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_GPIO_Pin_State(GPIO_Pin_t pin, bool state)
{
  if (state == get_GPIO_Pin_State(pin))
  {
    return ADS1299_SUCCESS;
  }
  if ((pin >= GPIO1) && (pin < GPIO_ERROR) && (state >= GPIO_OUTPUT) && (state < GPIO_MODE_ERROR))
  {
    uint8_t bitmask = 0x10 << pin;
    if (state)
    {
      return write_register(GPIO, Reg_Array[GPIO].Current_Value | bitmask);
    }
    bitmask = !bitmask;
    return write_register(GPIO, Reg_Array[GPIO].Current_Value & bitmask);
  }

  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Gets whether all electrods are referenced to SRB1.
 *
 * This is the preferred setup for referential montage.
 *
 * @return                          - The SRB1 connection status of the device.
 *
 *********************************************************************************************/
SRB1_Connection_Status_t ADS1299_Module::get_all_channel_SRB1_connection_status(void)
{
  uint8_t reg_data = read_register(MISC1);

  reg_data &= Param_Array[BITMSK_SRB1].Bitmask;
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


/*! ******************************************************************************************
 * @brief Sets whether all electrods are referenced to SRB1.
 *
 * This is the preferred setup for referential montage.
 *
 * @param[in]                       - The requested SRB1 connection status.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_all_channel_SRB1_connection_status(SRB1_Connection_Status_t new_state)
{
  if (new_state == get_all_channel_SRB1_connection_status())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_state >= SRB1_OPEN_ALL_CHANNELS) && (new_state < SRB1_ERROR))
  {
    if (new_state)
    {
      return write_register(MISC1, Reg_Array[MISC1].Current_Value | Param_Array[BITMSK_SRB1].Bitmask);
    }
    return write_register(MISC1, Reg_Array[MISC1].Current_Value & ~Param_Array[BITMSK_SRB1].Bitmask);
  }
  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Gets the current device conversion mode.
 *
 * Conversion modes are single shot or continuous.
 *
 * @return                          - The current conversion mode of the device.
 *
 *********************************************************************************************/
Conv_Mode_t ADS1299_Module::get_conversion_mode(void)
{
  uint8_t reg_data = read_register(CONFIG4);

  reg_data  &= Param_Array[BITMSK_SINGLE_SHOT].Bitmask;
  reg_data >>= Param_Array[BITMSK_SINGLE_SHOT].Shifts;
  switch (reg_data)
  {
  case CONTINUOUS_CONVERSION:
    return CONTINUOUS_CONVERSION;

  case SINGLE_SHOT:
    return SINGLE_SHOT;

  default:
    return CONV_MODE_ERROR;
  }
}


/*! ******************************************************************************************
 * @brief Sets the current device conversion mode.
 *
 * Conversion modes are single shot or continuous. When switching modes, the current conversion
 * must be stopped.
 *
 * @param[in] new_state             - The requested conversion mode of the device.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_conversion_mode(Conv_Mode_t new_state)
{
  if (new_state == get_conversion_mode())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_state >= CONTINUOUS_CONVERSION) && (new_state < CONV_MODE_ERROR))
  {
    send_command(STOP);
    uint8_t value = Reg_Array[CONFIG4].Current_Value & ~Param_Array[BITMSK_SINGLE_SHOT].Bitmask;
    return write_register(CONFIG4, value | (static_cast<uint8_t>(new_state) << Param_Array[BITMSK_SINGLE_SHOT].Shifts));
  }
  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Gets the current lead-off comparator status.
 *
 * @return                          - The current lead-off comparator status.
 *
 *********************************************************************************************/
LOff_Power_Status_t ADS1299_Module::get_LOff_power_status(void)
{
  uint8_t reg_data = read_register(CONFIG4);

  reg_data  &= Param_Array[BITMSK_PD_LOFF_COMP].Bitmask;
  reg_data >>= Param_Array[BITMSK_PD_LOFF_COMP].Shifts;
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


/*! ******************************************************************************************
 * @brief Sets the current lead-off comparator status.
 *
 * @param[in] new_state             - The requested lead-off comparator power state.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::set_LOff_power_status(LOff_Power_Status_t new_state)
{
  if (new_state == get_LOff_power_status())
  {
    return ADS1299_SUCCESS;
  }
  if ((new_state >= LOFF_POWER_DISABLED) && (new_state < LOFF_POWER_ERROR))
  {
    uint8_t value = Reg_Array[CONFIG4].Current_Value & ~Param_Array[BITMSK_PD_LOFF_COMP].Bitmask;
    return write_register(CONFIG4, value | ((static_cast<uint8_t>(new_state)) << Param_Array[BITMSK_PD_LOFF_COMP].Shifts));
  }
  return ADS1299_INVALID;
}


/*! ******************************************************************************************
 * @brief Reads back one sample from the ADS1299
 *
 * @param[in] output_buffer         - A buffer to write the data to.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
ADS1299_Status_t ADS1299_Module::read_sample(uint8_t *output_buffer)
{
#ifndef NO_SPI
  if (!is_running || (number_of_channels == 0))
  {
    return ADS1299_INVALID;
  }
  digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, LOW);
  delay(1);
  transfer(RREG);
  for (uint8_t byte_number = 0; byte_number < (3 + 3 * number_of_channels); byte_number++)
  {
    output_buffer[byte_number] = transfer(0x00);
#else
  for (uint8_t byte_number = 0; byte_number < (3 + 3 * 8); byte_number++)
  {
    output_buffer[byte_number] = 0xFF;
#endif
  }
  digitalWrite(Hardware_Info->Pin_Array[NOT_CHIP_SELECT].Pin, HIGH);
  return ADS1299_SUCCESS;
}


byte ADS1299_Module::transfer(byte payload)
{
  SPDR = payload;
  while (!(SPSR & _BV(SPIF)))
  {
  }
  return SPDR;
}
