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

#define VALID_DEVICE_ID    0x03                                                          /**< This is the valid Device ID, as defined in the datasheet. All other device IDs are considered invalid */

/* *INDENT-OFF* */
/*! ******************************************************************************************
 *
 *  @brief The Reg_Table holds information about the registers, which is used to generate
 *  the Reg_Array.
 *  
 *  Column A: Reg_ID: \tThe unique identifier for each register
 *  Column B: Address: \tThe address of the register in the ADS1299's memory
 *  Column C: Is Read Only: \tTrue if the register is read only.
 *  Column D: Default Value:\tThe value of the register on reset
 *  Column E: Is Bit Per Channel: \tTrue if the register corresponds 1 bit to 1 channel
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

/**! @breif This enum assigns a unique register ID to each register, and counts the number of registers. It also creates a REG_ERROR, which can be returned if no REG_ID is found, for example */
typedef enum Reg_ID_t
{
#define REG_ENTRY(a, b, c, d, e)    a,                                                   /**< This macro lists the IDs of the registers in the Reg_Table as a comma separated list */
  REG_TABLE
#undef REG_ENTRY
  NUM_REGS,                                                                              /**< The number of registers in the Reg_Array */
  REG_ERROR                                                                              /**< A value to return if there was an error finding a Reg_ID */
} Reg_ID_t;

/**! @brief This enum assigns a value to the different daisy chain modes */
typedef enum Daisy_Chain_Mode_t
{
  DAISY_CHAIN_MODE,                                                                      /**< The device is in daisy chain mode, and can be synchronised with other devices (default) */
  MULTIPLE_READBACK_MODE,
  DAISY_MODE_ERROR
} Daisy_Chain_Mode_t;

typedef enum Data_Rate_Setting_t
{
  SPS16k,
  SPS8k,
  SPS4k,
  SPS2k,
  SPS1k,
  SPS500,
  SPS250,
  SPS_ERROR
} Data_Rate_Setting_t;

typedef enum Command_t
{
  WAKEUP  = 0x02,
  STANDBY = 0x04,
  RESET   = 0x06,
  START   = 0x08,
  STOP    = 0x0A,
  RDATAC  = 0x10,
  SDATAC  = 0x11,
  RDATA   = 0x12,
  RREG    = 0x20,
  WREG    = 0x40
} Command_t;

typedef enum Test_Frequency_t
{
  TEST_FREQ_FCLK_DIV_2_21,
  TEST_FREQ_FCLK_DIV_2_20,
  TEST_FREQ_INVALID,
  TEST_FREQ_0,
  TEST_FREQ_ERROR
} Test_Frequency_t;

typedef enum Bias_Source_t
{
  BIAS_INTERNAL,
  BIAS_EXTERNAL,
  BIAS_ERROR
} Bias_Source_t;

typedef enum Bias_Power_State_t
{
  BIAS_POWER_OFF,
  BIAS_POWER_ON,
  BIAS_POWER_ERROR
} Bias_Power_State_t;

typedef enum Bias_Sense_Enable_t
{
  BIAS_SENSE_DISABLED,
  BIAS_SENSE_ENABLED,
  BIAS_SENSE_ERROR
} Bias_Sense_Enable_t;

typedef enum Bias_LOff_Status_t
{
  BIAS_CONNECTED,
  BIAS_DISCONNECTED,
  BIAS_LOFF_ERROR
} Bias_LOff_Status_t;

typedef enum LOff_Comp_Threshold_Var_t
{
  LOFF_5Per,
  LOFF_7Per5,
  LOFF_10Per,
  LOFF_12Per5,
  LOFF_15Per,
  LOFF_20Per,
  LOFF_25Per,
  LOFF_30Per,
  LOFF_THRESH_ERROR
} LOff_Comp_Threshold_Var_t;

typedef enum LOff_Current_t
{
  LOFF_CURRENT_6nA,
  LOFF_CURRENT_24nA,
  LOFF_CURRENT_6uA,
  LOFF_CURRENT_24uA,
  LOFF_CURRENT_ERROR
} LOff_Current_t;

typedef enum LOff_Freq_t
{
  LOFF_FREQ_DC,
  LOFF_FREQ_7Hz8,
  LOFF_FREQ_31Hz2,
  LOFF_FREQ_SPS_OVER_4,
  LOFF_FREQ_ERROR
} LOff_Freq_t;

typedef enum Channel_t
{
  CH1,
  CH2,
  CH3,
  CH4,
  CH5,
  CH6,
  CH7,
  CH8,
  CH_ERROR
} Channel_t;

typedef enum Channel_Power_State_t
{
  CH_POWER_ON,
  CH_POWER_OFF,
  CH_POWER_ERROR
} Channel_Power_State_t;

typedef enum Gain_Setting_t
{
  PGA1,
  PGA2,
  PGA4,
  PGA6,
  PGA8,
  PGA12,
  PGA24,
  PGA_ERROR
} Gain_Setting_t;

typedef enum SRB2_Connection_Status_t
{
  SRB2_OPEN,
  SRB2_CLOSED,
  SRB2_ERROR
} SRB2_Connection_Status_t;

typedef enum SRB1_Connection_Status_t
{
  SRB1_OPEN_ALL_CHANNELS,
  SRB1_CLOSED_ALL_CHANNELS,
  SRB1_ERROR
} SRB1_Connection_Status_t;

typedef enum Channel_Connection_Type_t
{
  CH_ELECTRODE_INPUT,
  CH_SHORTED,
  CH_BIAS_MEAS,
  CH_SUPPLY_MEAS,
  CH_TEMP_SENS,
  CH_TEST_SIG,
  CH_BIAS_DRIVE_POS,
  CH_BIAS_DRIVE_NEG,
  CH_CONNECTION_ERROR
} Channel_Connection_Type_t;

typedef enum GPIO_Pin_t
{
  GPIO1,
  GPIO2,
  GPIO3,
  GPIO4,
  GPIO_ERROR
} GPIO_Pin_t;

typedef enum GPIO_Mode_t
{
  GPIO_OUTPUT,
  GPIO_INPUT,
  GPIO_MODE_ERROR
} GPIO_Mode_t;

typedef enum Conv_Mode_t
{
  CONTINUOUS_CONVERSION,
  SINGLE_SHOT,
  CONV_MODE_ERROR
} Conv_Mode_t;

typedef enum LOff_Power_Status_t
{
  LOFF_POWER_DISABLED,
  LOFF_POWER_ENABLED,
  LOFF_POWER_ERROR
} LOff_Power_Status_t;

typedef enum ADS1299_Status_t
{
  ADS1299_SUCCESS,
  ADS1299_INVALID,
  ADS1299_COMMS_ERROR,
  ADS1299_UNHANDLED
} ADS1299_Status_t;

#endif
