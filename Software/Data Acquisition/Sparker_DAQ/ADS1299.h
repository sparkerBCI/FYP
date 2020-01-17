/*! ******************************************************************************************
 *  @file ADS1299.h
 *
 *  @brief This file holds the ADS1299_Module class function declarations.
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

#ifndef ADS1299_H
#define ADS1299_H

#include "DAQ_Pin_Map.h"
#include "ADS1299_Params.h"

#include <Arduino.h>

#ifndef NO_SPI
#define NO_SPI                                                                           /**< This is defined if we don't want to communicate to the ADS1299 over SPI. Remove this to communicate */
#endif

/*! ******************************************************************************************
 *  @brief The ADS1299_Module facilitates communication to and control of the ADC device.
 *
 *  It contains a lot of getters and setter for every setting possible, and commands to read
 *  from and write to registers. You can also send the basic commands to the device using this
 *  module.
 *
 *********************************************************************************************/
class ADS1299_Module {
public:

/*! ******************************************************************************************
 *  @brief Creates an ADS1299_Module and opens the SPI interface over which to communicate.
 *
 *  @param[in] Hardware_Info            - A Hardware Map so the module knows which pin to pull
 *                                        LOW to initiate a SPI transfer, which pin is START,
 *                                        etc.
 *
 *********************************************************************************************/
  explicit ADS1299_Module(DAQ_Pin_Map *m_Hardware_Info);

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
  Reg_ID_t get_Reg_ID_from_Address(uint8_t register_address);

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
  ADS1299_Status_t send_command(Command_t command);

/*! ******************************************************************************************
 * @brief Resets the device and waits the required time.
 *
 * The datasheet calls for a delay of 1.96us after issuing the RESET command, but we wait 1ms
 * just to be safe.
 *
 *********************************************************************************************/
  void reset(void);

/*! ******************************************************************************************
 * @brief Gets the device version from the ADS1299.
 *
 * This value is baked in to the ADS1299 by TI, and the datasheet doesn't give much info about
 * what the value represents, but we can read it!
 *
 * @return                          - The device version.
 *
 *********************************************************************************************/
  uint8_t get_device_version(void);

/*! ******************************************************************************************
 * @brief Gets the device ID from the ADS1299.
 *
 * If the value is not 0x03, something is wrong. Or check the datasheet, TI may have changed
 * things.
 *
 * @return                          - The device ID (expect 0x03).
 *
 *********************************************************************************************/
  uint8_t get_device_id(void);

/*! ******************************************************************************************
 * @brief Gets the number of channels from the ADS1299.
 *
 * @return                          - The number of channels (4, 6, or 8). 0 if error.
 *
 *********************************************************************************************/
  uint8_t get_num_channels_from_device(void);

/*! ******************************************************************************************
 * @brief Gets the number of channels as stored locally.
 *
 * @return                          - The number of channels (4, 6, or 8). 0 if error.
 *
 *********************************************************************************************/
  uint8_t get_num_channels(void)
  {
    return number_of_channels;
  }

/*! ******************************************************************************************
 * @brief Gets whether the device is in daisy chain mode or not.
 *
 * @return                          - The current daisy chain mode, or DAISY_MODE_ERROR if
 *                                    error.
 *
 *********************************************************************************************/
  Daisy_Chain_Mode_t get_daisy_mode(void);

/*! ******************************************************************************************
 * @brief Sets whether the device is in daisy chain mode or not.
 *
 * @param[in] new_mode              - The new daisy chain state.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t set_daisy_mode(Daisy_Chain_Mode_t new_mode);

/*! ******************************************************************************************
 * @brief Gets the current clock mode.
 *
 * If clock mode is true, the oscillator will output to the CLK pins if the CLKSEL pin is HIGH.
 *
 * @return                          - True if the oscillator will output on CLK pins if CLKSEL
 *                                    is HIGH. False otherwise. False if read error.
 *
 *********************************************************************************************/
  bool get_clock_mode(void);

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
  ADS1299_Status_t set_clock_mode(bool enable);

/*! ******************************************************************************************
 * @brief Gets the current data rate.
 *
 * The data rate determines how many samples per second the ADS1299 reads at.
 *
 * @return                          - The current data rate. SPS_ERROR if error.
 *
 *********************************************************************************************/
  Data_Rate_Setting_t get_data_rate(void);

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
  ADS1299_Status_t set_data_rate(Data_Rate_Setting_t new_rate);

/*! ******************************************************************************************
 * @brief Gets whether the test signal is sourced internally or externally.
 *
 * @return                          - True if the test signals are generated internally. False
 *                                    if the test signals are driven externally.
 *
 *********************************************************************************************/
  bool get_int_cal(void);

/*! ******************************************************************************************
 * @brief Sets whether the test signal is sourced internally or externally.
 *
 * @param[in] state                 - True if the test signals are to be generated internally.
 *                                    False if the test signals are to be driven externally.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t set_int_cal(bool state);

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
  bool get_cal_amp(void);

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
  ADS1299_Status_t set_cal_amp(bool state);

/*! ******************************************************************************************
 * @brief Gets the frequency of the test functions.
 *
 * @return                          - The frequency of the test signal. TEST_FREQ_ERROR if
 *                                    error.
 *
 *********************************************************************************************/
  Test_Frequency_t get_cal_freq(void);

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
  ADS1299_Status_t set_cal_freq(Test_Frequency_t new_freq);

/*! ******************************************************************************************
 * @brief Gets the power state of the internal reference buffer.
 *
 * Unless an external voltage reference is supplied, this should be powered on.
 *
 * @return                          - True if the internal reference buffer is powered on.
 *                                    False if the internal reference buffer is powered off.
 *
 *********************************************************************************************/
  bool get_reference_buffer_state(void);

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
  ADS1299_Status_t set_reference_buffer_state(bool new_state);

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
  bool get_bias_measurement_state(void);

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
  ADS1299_Status_t set_bias_measurement_state(bool new_state);

/*! ******************************************************************************************
 * @brief Gets whether the BIAS_REF signal is fed externally or is generated internally at a
 * mid-supply level (i.e. (AVDD + AVSS) / 2).
 *
 * If a BIAS_REF electrode is being used, this should be set to BIAS_EXTERNAL.
 *
 * @return                          - The bias signal source. BIAS_ERROR if error.
 *
 *********************************************************************************************/
  Bias_Source_t get_bias_source(void);

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
  ADS1299_Status_t set_bias_source(Bias_Source_t new_source);

/*! ******************************************************************************************
 * @brief Gets the current BIAS buffer state.
 *
 * @return                          - The current BIAS buffer state. BIAS_POWER_ERROR if error
 *
 *********************************************************************************************/
  Bias_Power_State_t get_bias_buffer_power_state(void);

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
  ADS1299_Status_t set_bias_buffer_power_state(Bias_Power_State_t new_state);

/*! ******************************************************************************************
 * @brief Gets the status of the bias sense function.
 *
 * @return                          - The state of the bias sense function. BIAS_SENSE_ERROR
 *                                    if error.
 *
 *********************************************************************************************/
  Bias_Sense_Enable_t get_bias_sense_state(void);

/*! ******************************************************************************************
 * @brief Enables or disables the bias sense function.
 *
 * @param[in] new_state             - The new state to set, enabling or disabling the bias
 *                                    sense function.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t set_bias_sense_state(Bias_Sense_Enable_t new_state);

/*! ******************************************************************************************
 * @brief Gets whether the BIAS lead is attached.
 *
 * @return                          - The status of the BIAS lead. BIAS_LOFF_ERROR if error.
 *
 *********************************************************************************************/
  Bias_LOff_Status_t get_bias_lead_off_state(void);

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
  LOff_Comp_Threshold_Var_t get_lead_off_comp_thresh(void);

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
  ADS1299_Status_t set_lead_off_comp_thresh(LOff_Comp_Threshold_Var_t new_thresh);

/*! ******************************************************************************************
 * @brief Gets the lead-off current (like Amps) magnitude.
 *
 * @return                          - The lead-off current level. LOFF_CURRENT_ERROR if error.
 *
 *********************************************************************************************/
  LOff_Current_t get_lead_off_current_mag(void);

/*! ******************************************************************************************
 * @brief Sets the lead-off current (like Amps) magnitude.
 *
 * @param[in] new_current           - The new current level for the lead-off detection.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t set_lead_off_current_mag(LOff_Current_t new_current);

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
  LOff_Freq_t get_lead_off_frequency(void);

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
  ADS1299_Status_t set_lead_off_frequency(LOff_Freq_t new_freq);

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
  Channel_Power_State_t get_channel_power_state(Channel_t channel);

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
  ADS1299_Status_t set_channel_power_state(Channel_t channel, Channel_Power_State_t new_state);

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
  Gain_Setting_t get_channel_gain(Channel_t channel);

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
  ADS1299_Status_t set_channel_gain(Channel_t channel, Gain_Setting_t new_state);

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
  SRB2_Connection_Status_t get_channel_SRB2_connection_status(Channel_t);

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
  ADS1299_Status_t set_channel_SRB2_connection_status(Channel_t channel, SRB2_Connection_Status_t new_state);

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
  Channel_Connection_Type_t get_channel_connection_type(Channel_t channel);

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
  ADS1299_Status_t set_channel_connection_type(Channel_t channel, Channel_Connection_Type_t new_state);

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
  bool get_channel_bias_drive_pos_derivation(Channel_t channel);

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
  ADS1299_Status_t set_channel_bias_drive_pos_derivation(Channel_t channel, bool new_state);

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
  bool get_channel_bias_drive_neg_derivation(Channel_t channel);

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
  ADS1299_Status_t set_channel_bias_drive_neg_derivation(Channel_t channel, bool new_state);

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
  bool get_channel_LOff_pos_enabled(Channel_t channel);

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
  ADS1299_Status_t set_channel_LOff_pos_enabled(Channel_t channel, bool new_state);

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
  bool get_channel_LOff_neg_enabled(Channel_t channel);

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
  ADS1299_Status_t set_channel_LOff_neg_enabled(Channel_t channel, bool new_state);

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
  bool get_channel_LOff_flip_enabled(Channel_t channel);

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
  ADS1299_Status_t set_channel_LOff_flip_enabled(Channel_t channel, bool new_state);

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
  bool get_channel_LOff_pos(Channel_t channel);

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
  bool get_channel_LOff_neg(Channel_t channel);

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
  GPIO_Mode_t get_GPIO_Pin_Mode(GPIO_Pin_t pin);

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
  ADS1299_Status_t set_GPIO_Pin_Mode(GPIO_Pin_t pin, GPIO_Mode_t mode);

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
  bool get_GPIO_Pin_State(GPIO_Pin_t pin);

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
  ADS1299_Status_t set_GPIO_Pin_State(GPIO_Pin_t pin, bool state);

/*! ******************************************************************************************
 * @brief Gets whether all electrods are referenced to SRB1.
 *
 * This is the preferred setup for referential montage.
 *
 * @return                          - The SRB1 connection status of the device.
 *
 *********************************************************************************************/
  SRB1_Connection_Status_t get_all_channel_SRB1_connection_status(void);

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
  ADS1299_Status_t set_all_channel_SRB1_connection_status(SRB1_Connection_Status_t new_state);

/*! ******************************************************************************************
 * @brief Gets the current device conversion mode.
 *
 * Conversion modes are single shot or continuous.
 *
 * @return                          - The current conversion mode of the device.
 *
 *********************************************************************************************/
  Conv_Mode_t get_conversion_mode(void);

/*! ******************************************************************************************
 * @brief Sets the current device conversion mode.
 *
 * Conversion modes are single shot or continuous. When switching modes, the current conversion
 * must be stopped. @todo make it stop
 *
 * @param[in] new_state             - The requested conversion mode of the device.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t set_conversion_mode(Conv_Mode_t new_state);

/*! ******************************************************************************************
 * @brief Gets the current lead-off comparator status.
 *
 * @return                          - The current lead-off comparator status.
 *
 *********************************************************************************************/
  LOff_Power_Status_t get_LOff_power_status(void);

/*! ******************************************************************************************
 * @brief Sets the current lead-off comparator status.
 *
 * @param[in] new_state             - The requested lead-off comparator power state.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t set_LOff_power_status(LOff_Power_Status_t new_state);

/*! ******************************************************************************************
 * @brief Reads back one sample from the ADS1299
 *
 * @param[in] output_buffer         - A buffer to write the data to.
 *
 * @return                          - ADS1299_Status_t indicating success / failure.
 *
 *********************************************************************************************/
  ADS1299_Status_t read_sample(uint8_t *output_buffer);

/*! ******************************************************************************************
 * @brief This struct contains information about a register
 *
 *********************************************************************************************/
  typedef struct Reg_Array_t
  {
    Reg_ID_t Reg_ID;                                                                     /**< The unique Register ID associated with the register */
    uint8_t  Address;                                                                    /**< The address of the register in the ADS1299's memory */
    bool     Read_Only;                                                                  /**< True if the register is read only. False otherwise */
    uint8_t  Value_on_Reset;                                                             /**< The value of the register on reset */
    uint8_t  Current_Value;                                                              /**< The current value of the register */
    bool     Bit_Per_Channel;                                                            /**< True if the regsiter holds info about all the channels, 1 bit per channel */
  } Reg_Areay_t;

/* Create the register array and populate the value with default value */
#define REG_ENTRY(a, b, c, d, e)    { a, b, c, d, d, e },                                /**< This macro generates an array of Reg_Array_t entries, and sets the current value of the registers to their default value */
  Reg_Array_t Reg_Array[NUM_REGS] = { REG_TABLE };
#undef REG_ENTRY


  bool is_running = false;                                                               /**< This bool indicates true if the ADS1299 is converting. False otherwise */


private:

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
  ADS1299_Status_t write_register(Reg_ID_t Register, uint8_t value);

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
  ADS1299_Status_t write_register(int Register_Address, uint8_t value);

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
  uint8_t read_register(Reg_ID_t Register);

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
  uint8_t read_register(int Register_Address);

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
  bool get_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel);

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
  ADS1299_Status_t set_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel, bool new_state);

  DAQ_Pin_Map *Hardware_Info;                                                            /**< This holds information about how the ADS1299 is connected to the MCU */


  uint8_t number_of_channels = 0;                                                        /**< This holds the number of channels that the ADS1299 has. Initialised to 0, an invalid number */
};

#endif
