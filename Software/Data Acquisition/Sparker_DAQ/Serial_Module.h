#ifndef SERIAL_MODULE_H
#define SERIAL_MODULE_H

#include <Arduino.h>

#define MAX_ADC_CHANNELS    8

typedef struct Sample_Data_t
{
  uint32_t id;
  uint8_t  Positive_Lead_Off_Status;
  uint8_t  Negative_Lead_Off_Status;
  uint8_t  GPIO_Data;
  uint32_t Channel_Data[MAX_ADC_CHANNELS];
} Sample_Data_t;

class Serial_Module {
public:
  explicit Serial_Module();

  void send_line(String input);
  void errorMsg(String input);
  void warningMsg(String input);
  void debugMsg(String input);
  bool send_sample(Sample_Data_t input_sample);
  String get_runtime(unsigned long time_ms);

  bool debug_enabled = false;
  bool msg_enabled   = false;

private:
};

#endif
