/*! ******************************************************************************************
 *  @file ADS1299_Params.h
 *
 *  @brief This file holds the XMacros Table of register info, and many enums that make
 *  getting and setting configuration values more readable.
 *
 *  @author Sam Parker
 *
 *  Copyright (c) Sam Parker 2020 <br/> All rights reserved.
 *
 *********************************************************************************************/

#ifndef ADS1299_PARAMS_H
#define ADS1299_PARAMS_H

#include <Arduino.h>

#define VALID_DEVICE_ID    0x03                                                /**< This is the valid Device ID, as defined in the datasheet. All other device IDs are considered invalid */

/* *INDENT-OFF* */
/*! ******************************************************************************************
 *
 *  @brief The Reg_Table holds information about the registers, which is used to generate
 *  the Reg_Array.
 *  
 *  Column A: Reg_ID: The unique identifier for each register
 *  Column B: Address: The address of the register in the ADS1299's memory
 *  Column C: Is Read Only: True if the register is read only.
 *  Column D: Default Value:The value of the register on reset
 *  Column E: Is Bit Per Channel: True if the register corresponds 1 bit to 1 channel
 *
 *********************************************************************************************/
#define REG_TABLE                                                                                                         \
   /*           Reg_ID        Address      Is Read Only     Default Value       Is Bit per Channel       */               \
   REG_ENTRY(ID,               0x00,           true,            0xFF,               false)                \
   REG_ENTRY(CONFIG1,          0x01,          false,            0x96,               false)                \
   REG_ENTRY(CONFIG2,          0x02,          false,            0xC0,               false)                \
   REG_ENTRY(CONFIG3,          0x03,          false,            0x60,               false)                \
   REG_ENTRY(LOFF,             0x04,          false,            0x00,               false)                \
   REG_ENTRY(CH1SET,           0x05,          false,            0x61,               false)                \
   REG_ENTRY(CH2SET,           0x06,          false,            0x61,               false)                \
   REG_ENTRY(CH3SET,           0x07,          false,            0x61,               false)                \
   REG_ENTRY(CH4SET,           0x08,          false,            0x61,               false)                \
   REG_ENTRY(CH5SET,           0x09,          false,            0x61,               false)                \
   REG_ENTRY(CH6SET,           0x0A,          false,            0x61,               false)                \
   REG_ENTRY(CH7SET,           0x0B,          false,            0x61,               false)                \
   REG_ENTRY(CH8SET,           0x0C,          false,            0x61,               false)                \
   REG_ENTRY(BIAS_SENSP,       0x0D,          false,            0x00,                true)                \
   REG_ENTRY(BIAS_SENSN,       0x0E,          false,            0x00,                true)                \
   REG_ENTRY(LOFF_SENSP,       0x0F,          false,            0x00,                true)                \
   REG_ENTRY(LOFF_SENSN,       0x10,          false,            0x00,                true)                \
   REG_ENTRY(LOFF_FLIP,        0x11,          false,            0x00,                true)                \
   REG_ENTRY(LOFF_STATP,       0x12,          true,             0x00,                true)                \
   REG_ENTRY(LOFF_STATN,       0x13,          true,             0x00,                true)                \
   REG_ENTRY(GPIO,             0x14,          false,            0x0F,               false)                \
   REG_ENTRY(MISC1,            0x15,          false,            0x00,               false)                \
   REG_ENTRY(MISC2,            0x16,          false,            0x00,               false)                \
   REG_ENTRY(CONFIG4,          0x17,          false,            0x00,               false)
/* *INDENT-ON* */

/*! @brief This enum assigns a unique register ID to each register, and counts the number of registers. It also creates a REG_ERROR, which can be returned if no REG_ID is found, for example */
typedef enum Reg_ID_t
{
#define REG_ENTRY(a, b, c, d, e)    a,                                         /**< This macro lists the IDs of the registers in the Reg_Table as a comma separated list */
  REG_TABLE
#undef REG_ENTRY
  NUM_REGS,                                                                    /**< The number of registers in the Reg_Array */
  REG_ERROR                                                                    /**< A value to return if there was an error finding a Reg_ID */
} Reg_ID_t;

/*! @brief This enum assigns a value to the different daisy chain modes */
typedef enum Daisy_Chain_Mode_t
{
  DAISY_CHAIN_MODE,                                                            /**< The device is in daisy chain mode, and can be synchronised with other devices (default) */
  MULTIPLE_READBACK_MODE,                                                      /**< The device is in multiple readback mode */
  DAISY_MODE_ERROR                                                             /**< A return value for if there was an error associated with the daisy chain mode */
} Daisy_Chain_Mode_t;

/*! @brief This enum assigns a value to different data rates */
typedef enum Data_Rate_Setting_t
{
  SPS16k,                                                                      /**< 16k Samples per Second */
  SPS8k,                                                                       /**< 8k Samples per Second */
  SPS4k,                                                                       /**< 4k Samples per Second */
  SPS2k,                                                                       /**< 2k Samples per Second */
  SPS1k,                                                                       /**< 1k Samples per Second */
  SPS500,                                                                      /**< 500 Samples per Second */
  SPS250,                                                                      /**< 250 Samples per Second (default) */
  SPS_ERROR                                                                    /**< A return value for if there is an error associated with the sample rate */
} Data_Rate_Setting_t;

/*! @brief This enum associates a value with each ADS1299 command */
typedef enum Command_t
{
  WAKEUP  = 0x02,                                                              /**< Wakes the device out of low-power standby mode */
  STANDBY = 0x04,                                                              /**< Enters the device into low-power standby mode */
  RESET   = 0x06,                                                              /**< Resets the device by issueing a power cycle and resetting the registers to their default value */
  START   = 0x08,                                                              /**< Starts analog to digital conversion. No settings can be changed while the device is running */
  STOP    = 0x0A,                                                              /**< Stops converting. The device must be stopped before changing settings */
  RDATAC  = 0x10,                                                              /**< Reads data continuously from the device */
  SDATAC  = 0x11,                                                              /**< Stops continuous data reading from the device */
  RDATA   = 0x12,                                                              /*< Reads 1 sample of data from the device */
  RREG    = 0x20,                                                              /**< Reads the value of a register */
  WREG    = 0x40                                                               /**< Writes register data to the device */
} Command_t;

/*! @brief This enum assigns values to different test signal frequencies */
typedef enum Test_Frequency_t
{
  TEST_FREQ_FCLK_DIV_2_21,                                                     /**< The test signal is pulsed at the clock frequency / (2 ^ 21) Hz (default) */
  TEST_FREQ_FCLK_DIV_2_20,                                                     /**< The test signal is pulsed at the clock frequency / (2 ^ 20) Hz */
  TEST_FREQ_INVALID,                                                           /**< This test frequency should not be used */
  TEST_FREQ_0,                                                                 /**< The test signal is DC */
  TEST_FREQ_ERROR                                                              /**< This is a return value for if there is an error associated with the test frequency */
} Test_Frequency_t;

/*! @brief This enum assigns values to different test bias signal sources */
typedef enum Bias_Source_t
{
  BIAS_INTERNAL,                                                               /**< The bias signal (AVDD + AVSS) / 2 is generated internally */
  BIAS_EXTERNAL,                                                               /**< The bias signal is fed externally (default) */
  BIAS_ERROR                                                                   /**< This is a return value for if there is an error associated with the bias signal source */
} Bias_Source_t;

/*! @brief This enum assigns values to different bias buffer power states */
typedef enum Bias_Power_State_t
{
  BIAS_POWER_OFF,                                                              /**< This settings powers down the bias buffer (default) */
  BIAS_POWER_ON,                                                               /**< This setting powers on the bias buffer */
  BIAS_POWER_ERROR                                                             /**< This is a return value for if there is an error associated with the bias buffer power state */
} Bias_Power_State_t;

/*! @brief This enum assigns values to different bias sense enable states */
typedef enum Bias_Sense_Enable_t
{
  BIAS_SENSE_DISABLED,                                                         /**< This setting disables bias signal sensing (default) */
  BIAS_SENSE_ENABLED,                                                          /**< This setting enables bias signal sensing */
  BIAS_SENSE_ERROR                                                             /**< This is a return value for if there is an error with the bias sense function */
} Bias_Sense_Enable_t;

/*! @brief This enum assigns values to whether the bias lead is connected or not */
typedef enum Bias_LOff_Status_t
{
  BIAS_CONNECTED,                                                              /**< This state means the bias lead is connected (default) */
  BIAS_DISCONNECTED,                                                           /**< This state means the bias lead is disconnected */
  BIAS_LOFF_ERROR                                                              /**< This is a return value for if there was an error associated with the bias lead-off status */
} Bias_LOff_Status_t;

/*! @brief This enum assigns values to different lead-off comparator thresholds */
typedef enum LOff_Comp_Threshold_Var_t
{
  LOFF_5Per,                                                                   /**< This setting sets the lead-off comparator threshold at 95% for positive, 5% for negative (default) */
  LOFF_7Per5,                                                                  /**< This setting sets the lead-off comparator threshold at 92.5% for positive, 7.5% for negative */
  LOFF_10Per,                                                                  /**< This setting sets the lead-off comparator threshold at 90% for positive, 10% for negative */
  LOFF_12Per5,                                                                 /**< This setting sets the lead-off comparator threshold at 87.5% for positive, 12.5% for negative */
  LOFF_15Per,                                                                  /**< This setting sets the lead-off comparator threshold at 85% for positive, 15% for negative */
  LOFF_20Per,                                                                  /**< This setting sets the lead-off comparator threshold at 80% for positive, 20% for negative */
  LOFF_25Per,                                                                  /**< This setting sets the lead-off comparator threshold at 75% for positive, 25% for negative */
  LOFF_30Per,                                                                  /**< This setting sets the lead-off comparator threshold at 70% for positive, 30% for negative */
  LOFF_THRESH_ERROR                                                            /**< This is a return value for if there is an error associated with the lead-off comparator threshold */
} LOff_Comp_Threshold_Var_t;

/*! @brief This enum assigns values to different lead-off current settings*/
typedef enum LOff_Current_t
{
  LOFF_CURRENT_6nA,                                                            /**< The lead-off current will be 6nA (default) */
  LOFF_CURRENT_24nA,                                                           /**< The lead-off current will be 24nA */
  LOFF_CURRENT_6uA,                                                            /**< The lead-off current will be 6uA */
  LOFF_CURRENT_24uA,                                                           /**< The lead-off current will be 24uA */
  LOFF_CURRENT_ERROR                                                           /**< This is a return value for if there is an error associated with the lead-off current */
} LOff_Current_t;

/*! @brief This enum assigns values to different lead-off detection frequency */
typedef enum LOff_Freq_t
{
  LOFF_FREQ_DC,                                                                /**< DC lead-off detection (default) */
  LOFF_FREQ_7Hz8,                                                              /**< AC lead-off detection at 7.8Hz */
  LOFF_FREQ_31Hz2,                                                             /**< AC lead-off detection at 31.2Hz */
  LOFF_FREQ_SPS_OVER_4,                                                        /**< AC lead of detection at 1/4 * the selected data rate */
  LOFF_FREQ_ERROR                                                              /**< This is a return value for if there is an error assocaited with the lead-off frequency */
} LOff_Freq_t;

/*! @brief This enum assigns values to the channels of the ADC */
typedef enum Channel_t
{
  CH1,                                                                         /**< Channel 1 */
  CH2,                                                                         /**< Channel 2 */
  CH3,                                                                         /**< Channel 3 */
  CH4,                                                                         /**< Channel 4 */
  CH5,                                                                         /**< Channel 5 */
  CH6,                                                                         /**< Channel 6 */
  CH7,                                                                         /**< Channel 7 */
  CH8,                                                                         /**< Channel 8 */
  CH_ERROR                                                                     /**< This is a return value for if there is an error finding the requested channel */
} Channel_t;

/*! @brief This enum assigns values to the different channel poower states */
typedef enum Channel_Power_State_t
{
  CH_POWER_ON,                                                                 /**< The channel is powered on (default) */
  CH_POWER_OFF,                                                                /**< The channel is powered off. Channels in this state should also be shorted to ground by setting its connection type to SHORT */
  CH_POWER_ERROR                                                               /**< This is a return value for if there is an error associated with the channel power state */
} Channel_Power_State_t;

/*! @brief This enum assigns values to the different channel gain settings */
typedef enum Gain_Setting_t
{
  PGA1,                                                                        /**< The gain of the channel is 1 */
  PGA2,                                                                        /**< The gain of the channel is 2 */
  PGA4,                                                                        /**< The gain of the channel is 4 */
  PGA6,                                                                        /**< The gain of the channel is 6 */
  PGA8,                                                                        /**< The gain of the channel is 8 */
  PGA12,                                                                       /**< The gain of the channel is 12 */
  PGA24,                                                                       /**< The gain of the channel is 24 (default) */
  PGA_ERROR                                                                    /**< This is a return value for if there is an error associated with the channel gain setting */
} Gain_Setting_t;

/*! @brief This enum assigns values to the SRB2 connection state of each channel */
typedef enum SRB2_Connection_Status_t
{
  SRB2_OPEN,                                                                   /**< The channel's negative signal is not connected to SRB2 (default) */
  SRB2_CLOSED,                                                                 /**< The channel's positive signal is connected to SRB2 */
  SRB2_ERROR                                                                   /**< This is a return value for if there is an error associated with the channel's SRB2 connection */
} SRB2_Connection_Status_t;

/*! @brief This enum assigns values to the SRB1 connection status of all the channels */
typedef enum SRB1_Connection_Status_t
{
  SRB1_OPEN_ALL_CHANNELS,                                                      /**< All the channels are not referenced to SRB1. This is generally used in differentiual montage (default)*/
  SRB1_CLOSED_ALL_CHANNELS,                                                    /**< All the channels are referenced to SRB1, This is generally used in referred montage */
  SRB1_ERROR                                                                   /**< This is a return value for if there is an error associated with the global SRB1 connection */
} SRB1_Connection_Status_t;

/*! @brief This enum assigns values to the different channel connection types  */
typedef enum Channel_Connection_Type_t
{
  CH_ELECTRODE_INPUT,                                                          /**< The channel is a regular electrode connection */
  CH_SHORTED,                                                                  /**< The channel is unused, and is therefore shorted to AVSS (default) */
  CH_BIAS_MEAS,                                                                /**< If bias measurement has been enabled, this channel is used to measure the bias signal */
  CH_SUPPLY_MEAS,                                                              /**< This signal is MVDD for supply measurements */
  CH_TEMP_SENS,                                                                /**< This channel is a temperature sensor */
  CH_TEST_SIG,                                                                 /**< This channel is an externally driven test signal */
  CH_BIAS_DRIVE_POS,                                                           /**< This channel's positive electrode is a bias driver */
  CH_BIAS_DRIVE_NEG,                                                           /**< This channel's negative electrode is a bias driver */
  CH_CONNECTION_ERROR                                                          /**< This is a return value for if there is an error associated with the channel connection type */
} Channel_Connection_Type_t;

/*! @brief This enum assigns values to the GPIO pins of the device */
typedef enum GPIO_Pin_t
{
  GPIO1,                                                                       /**< GPIO Pin 1 */
  GPIO2,                                                                       /**< GPIO Pin 2 */
  GPIO3,                                                                       /**< GPIO Pin 3 */
  GPIO4,                                                                       /**< GPIO Pin 4 */
  GPIO_ERROR                                                                   /**< This is a return value for if there is an error associated with the GPIO pins */
} GPIO_Pin_t;

/*! @brief This enum assigns values to the different GPIO modes of each pin */
typedef enum GPIO_Mode_t
{
  GPIO_OUTPUT,                                                                 /**< This GPIO pin is an output */
  GPIO_INPUT,                                                                  /**< This GPIO pin is an input (default) */
  GPIO_MODE_ERROR                                                              /**< This is a return value for if there is an error associated with the GPIO mode */
} GPIO_Mode_t;

/*! @brief This enum assigns values to the different conversion modes of the device  */
typedef enum Conv_Mode_t
{
  CONTINUOUS_CONVERSION,                                                       /**< The device will continue to convert until the STOP command is sent (default) */
  SINGLE_SHOT,                                                                 /**< The device will convert 1 sample per START command sent */
  CONV_MODE_ERROR                                                              /**< This is a return value for if there is an error associated with the converion mode */
} Conv_Mode_t;

/*! @brief This enum assigns values to the lead-off comparator power states */
typedef enum LOff_Power_Status_t
{
  LOFF_POWER_DISABLED,                                                         /**< This removes power from the lead-off comparator (default) */
  LOFF_POWER_ENABLED,                                                          /**< This provides power to the lead-off comparator */
  LOFF_POWER_ERROR                                                             /**< This is a return value for if there is an error associated with the lead-off power state */
} LOff_Power_Status_t;

/*! @brief This enum creates several return value to indicate the success or failure of various operations */
typedef enum ADS1299_Status_t
{
  ADS1299_SUCCESS,                                                             /**< The operation executed successfully */
  ADS1299_INVALID,                                                             /**< The operation requested was invalid, e.g. invalid parameters */
  ADS1299_COMMS_ERROR,                                                         /**< There was a comms error and the data was not sent */
  ADS1299_UNHANDLED                                                            /**< An unhandled case was encountered */
} ADS1299_Status_t;

#endif
