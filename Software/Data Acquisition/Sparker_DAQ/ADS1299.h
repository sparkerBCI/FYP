#ifndef _ADS1299_H
#define _ADS1299_H

#include "DAQ_Pin_Map.h"
#include "ADS1299_Params.h"

#include <Arduino.h>


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


  Reg_ID_t get_Reg_ID_from_Address(uint8_t register_address);


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


  SRB2_Connection_Status_t get_channel_SRB2_connection_status(Channel_t);


  bool set_channel_SRB2_connection_status(Channel_t channel, SRB2_Connection_Status_t new_state);


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


  LOff_Power_Status_t get_LOff_power_status(void);


  bool set_LOff_power_status(LOff_Power_Status_t new_state);


private:

  bool write_register(Reg_ID_t Register, uint8_t value);


  bool write_register(int Register_Address, uint8_t value);


  uint8_t read_register(Reg_ID_t Register);


  uint8_t read_register(int Register_Address);

  DAQ_Pin_Map *Hardware_Info;
};

#endif
