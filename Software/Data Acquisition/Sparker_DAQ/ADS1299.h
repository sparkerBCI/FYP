#ifndef _ADS1299_H
#define _ADS1299_H

#include "DAQ_Pin_Map.h"

#include <Arduino.h>


/* *INDENT-OFF* */
#define REG_TABLE                                                                    \
   /*           a                b              c                d  */               \
   REG_ENTRY(ID,               0x00,           true,            0xFF)                \
   REG_ENTRY(CONFIG1,          0x01,          false,            0x96)                \
   REG_ENTRY(CONFIG2,          0x02,          false,            0xC0)                \
   REG_ENTRY(CONFIG3,          0x03,          false,            0x60)                \
   REG_ENTRY(LOFF,             0x04,          false,            0x00)                \
   REG_ENTRY(CH1SET,           0x05,          false,            0x61)                \
   REG_ENTRY(CH2SET,           0x06,          false,            0x61)                \
   REG_ENTRY(CH3SET,           0x07,          false,            0x61)                \
   REG_ENTRY(CH4SET,           0x08,          false,            0x61)                \
   REG_ENTRY(CH5SET,           0x09,          false,            0x61)                \
   REG_ENTRY(CH6SET,           0x0A,          false,            0x61)                \
   REG_ENTRY(CH7SET,           0x0B,          false,            0x61)                \
   REG_ENTRY(CH8SET,           0x0C,          false,            0x61)                \
   REG_ENTRY(BIAS_SENSP,       0x0D,          false,            0x00)                \
   REG_ENTRY(BIAS_SENSN,       0x0E,          false,            0x00)                \
   REG_ENTRY(LOFF_SENSP,       0x0F,          false,            0x00)                \
   REG_ENTRY(LOFF_SENSN,       0x10,          false,            0x00)                \
   REG_ENTRY(LOFF_FLIP,        0x11,          false,            0x00)                \
   REG_ENTRY(LOFF_STATP,       0x12,          false,            0x00)                \
   REG_ENTRY(LOFF_STATN,       0x13,          false,            0x00)                \
   REG_ENTRY(GPIO,             0x14,          false,            0x0F)                \
   REG_ENTRY(MISC1,            0x15,          false,            0x00)                \
   REG_ENTRY(MISC2,            0x16,          false,            0x00)                \
   REG_ENTRY(CONFIG4,          0x17,          false,            0x00)
/* *INDENT-ON* */

typedef enum Reg_ID_t
{
#define REG_ENTRY(a, b, c, d)    a,
  REG_TABLE
#undef REG_ENTRY
  NUM_REGS
} Reg_ID_t;

typedef enum Gain_Setting_t
{
  PGA1  =  1,
  PGA2  =  2,
  PGA4  =  4,
  PGA6  =  6,
  PGA8  =  8,
  PGA12 = 12,
  PGA24 = 24,
  PGA_ERROR
} Gain_Setting_t;

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
  TEST_FREQ_FCLK_DIV_2_21 = 0x02,
  TEST_FREQ_FCLK_DIV_2_20 = 0x04,
  TEST_FREQ_INVALID       = 0x06,
  TEST_FREQ_0             = 0x08
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

class ADS1299_Module {
public:
  explicit ADS1299_Module(DAQ_Pin_Map *m_Hardware_Info);

  typedef struct Reg_Array_t
  {
    Reg_ID_t Reg_ID;
    uint8_t  Address;
    bool     Read_Only;
    uint8_t  Value_on_Reset;
    uint8_t  Current_Value;
  } Reg_Areay_t;

/* Create the register array and populate the value with default value */
#define REG_ENTRY(a, b, c, d)    { a, b, c, d, d },
  Reg_Array_t Reg_Array[NUM_REGS] = { REG_TABLE };
#undef REG_ENTRY

  void set_value(Reg_ID_t Register, uint8_t new_value);


  uint8_t get_value(Reg_ID_t Register);


  uint8_t read_register(Reg_ID_t Register);


  uint8_t write_register(Reg_ID_t Register, uint8_t value);


  uint8_t send_command(Command_t command);


  void reset(void);


  uint8_t get_device_version(void);


  uint8_t get_device_id(void);


  uint8_t get_num_channels(void);


  bool get_daisy_mode(void);


  bool set_daisy_mode(bool enable);


  bool get_clock_mode(void);


  bool set_clock_mode(bool enable);


  Data_Rate_Setting_t get_data_rate(void);


  bool set_data_rate(Data_Rate_Setting_t new_rate);


  bool get_int_cal(void);


  bool set_int_cal(bool state);


  bool get_cal_amp(void);


  bool set_cal_amp(bool state);


  Test_Frequency_t get_cal_freq(void);


  bool set_cal_freq(Test_Frequency_t new_freq);


  bool get_reference_buffer_state(void);


  bool set_reference_buffer_state(bool new_state);


  bool get_bias_measurement_state(void);


  bool set_bias_measurement_state(bool new_state);


  Bias_Source_t get_bias_source(void);


  bool set_bias_source(Bias_Source_t new_source);


  Bias_Power_State_t get_bias_buffer_power_state(void);


  bool set_bias_power_state(Bias_Power_State_t new_state);


  Bias_Sense_Enable_t get_bias_sense_state(void);


  bool set_bias_sense_state(Bias_Sense_Enable_t new_state);


  Bias_LOff_Status_t get_bias_lead_off_state(void);


  LOff_Comp_Threshold_Var_t get_lead_off_comp_thresh(void);


  bool set_lead_off_comp_thresh(LOff_Comp_Threshold_Var_t new_thresh);


  LOff_Current_t get_lead_off_current_mag(void);


  bool set_lead_off_current_mag(LOff_Current_t new_current);


private:

  DAQ_Pin_Map *Hardware_Info;
};

#endif
