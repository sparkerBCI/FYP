#include "Serial_Module.h"


Serial_Module::Serial_Module()
{
  Serial.begin(38400);
}


void Serial_Module::send_line(String input)
{
  Serial.println(input);
}


void Serial_Module::errorMsg(String input)
{
  if (msg_enabled)
  {
    Serial.println(get_runtime(millis()) + "Error:\t" + input);
  }
}


void Serial_Module::warningMsg(String input)
{
  if (msg_enabled)
  {
    Serial.println(get_runtime(millis()) + "Warn:\t" + input);
  }
}


void Serial_Module::debugMsg(String input)
{
  if (debug_enabled && msg_enabled)
  {
    Serial.println(get_runtime(millis()) + "Debug:" + input);
  }
}


bool Serial_Module::send_sample(Sample_Data_t input_sample)
{
  if (!Serial)
  {
    warningMsg("Serial not available!");
    return false;
  }
  Serial.print(input_sample.id);
  for (uint8_t i = 0; i < MAX_ADC_CHANNELS; i++)
  {
    Serial.print(input_sample.Channel_Data[i]);
  }
  Serial.print(0xFF);
  return true;
}


String Serial_Module::get_runtime(unsigned long time_ms)
{
  unsigned int time_s = time_ms / 1000;
  unsigned int time_m = time_s / 60;
  unsigned int time_h = time_m / 60;

  return(String(time_h) + String(":") + String(time_m) + String(":") + String(time_s) + String(".") + String(time_ms % 1000) + String(":\t"));
}
