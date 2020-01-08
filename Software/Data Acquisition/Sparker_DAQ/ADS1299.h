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
  NUM_REGS,
  REG_ERROR
} Reg_ID_t;

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

typedef enum LOff_Conv_Mode_t
{
  LOFF_CONTINUOUS_CONVERSION,
  LOFF_SINGLE_SHOT,
  LOFF_CONV_MODE_ERROR
} LOff_Conv_Mode_t;

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


  uint8_t read_register(int Register_Address);


  Reg_ID_t get_Reg_ID_from_Address(uint8_t register_address);


  bool write_register(Reg_ID_t Register, uint8_t value);


  bool write_register(int Register_Address, uint8_t value);


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


  LOff_Freq_t get_lead_off_frequency(void);


  bool set_lead_off_frequency(LOff_Freq_t new_freq);


  Channel_Power_State_t get_channel_power_state(Channel_t channel);


  bool set_channel_power_state(Channel_t channel, Channel_Power_State_t new_state);


  Gain_Setting_t get_channel_gain(Channel_t channel);


  bool set_channel_gain(Channel_t channel, Gain_Setting_t new_state);


  SRB2_Connection_Status_t get_channel_SRB1_connection_status(Channel_t);


  bool set_channel_SRB1_connection_status(Channel_t channel, SRB2_Connection_Status_t new_state);


  Channel_Connection_Type_t get_channel_connection_type(Channel_t channel);


  bool set_channel_connection_type(Channel_t channel, Channel_Connection_Type_t new_state);


  bool get_channel_bias_drive_pos_derivation(Channel_t channel);


  bool set_channel_bias_drive_pos_derivation(Channel_t channel, bool new_state);


  bool get_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel);


  bool set_bit_addressable_channel_info(Reg_ID_t Register, Channel_t channel, bool new_state);


  bool get_channel_bias_drive_neg_derivation(Channel_t channel);


  bool set_channel_bias_drive_neg_derivation(Channel_t channel, bool new_state);


  bool get_channel_LOff_pos_enabled(Channel_t channel);


  bool set_channel_LOff_pos_enabled(Channel_t channel, bool new_state);


  bool get_channel_LOff_neg_enabled(Channel_t channel);


  bool set_channel_LOff_neg_enabled(Channel_t channel, bool new_state);


  bool get_channel_LOff_flip_enabled(Channel_t channel);


  bool set_channel_LOff_flip_enabled(Channel_t channel, bool new_state);


  bool get_channel_LOff_pos(Channel_t channel);


  bool get_channel_LOff_neg(Channel_t channel);


  GPIO_Mode_t get_GPIO_Pin_Mode(GPIO_Pin_t pin);


  bool set_GPIO_Pin_Mode(GPIO_Pin_t pin, GPIO_Mode_t mode);


  bool get_GPIO_Pin_State(GPIO_Pin_t pin);


  bool set_GPIO_Pin_State(GPIO_Pin_t pin, bool state);


  SRB1_Connection_Status_t get_all_channel_SRB1_connection_status(void);


  bool set_all_channel_SRB1_connection_status(SRB1_Connection_Status_t new_state);


  LOff_Conv_Mode_t get_LOff_conversion_mode(void);


  bool set_LOff_conversion_mode(LOff_Conv_Mode_t new_state);


private:

  DAQ_Pin_Map *Hardware_Info;
};

#endif
