/*! ******************************************************************************************
 *  @file Serial_Module.cpp
 *
 *  @brief This file holds implentations for functions to communicate over the serial
 *  interface.
 *
 *  This includes Error, Warning, and Debug messages, which are formatted to include
 *  the runtime (HH:MM:SS.MS format). These messages can be globally enabled by setting
 *  msg_enabled to true. Debug messages require an additional setting of debug_enabled to true.
 *
 *  @author Sam Parker
 *
 *  Copyright (c) Sam Parker 2020 <br/> All rights reserved.
 *
 *********************************************************************************************/

#include "Serial_Module.h"

/*! ******************************************************************************************
 *  @brief Constructs a new Serial Module with a baud rate of 38400.
 *
 *********************************************************************************************/
Serial_Module::Serial_Module()
{
  Serial.begin(38400);
}


/*! ******************************************************************************************
 *  @brief Sends a given string over the UART interface. Terminated by "\n".
 *
 *  @param[in] input                   - The string to send
 *
 *********************************************************************************************/
void Serial_Module::send_line(String input)
{
  Serial.println(input);
}


/*! ******************************************************************************************
 *  @brief Sends an error message, by prepending the error prefix and timestamp. Terminated
 *  by "\n".
 *
 *  @param[in] input                   - The string to send after the error prefix
 *
 *********************************************************************************************/
void Serial_Module::errorMsg(String input)
{
  if (msg_enabled)
  {
    Serial.println(get_runtime(millis()) + "Error:\t" + input);
  }
}


/*! ******************************************************************************************
 *  @brief Sends a warning message, by prepending the warning prefix and timestamp. Terminated
 *  by "\n".
 *
 *  @param[in] input                   - The string to send after the warning prefix
 *
 *********************************************************************************************/
void Serial_Module::warningMsg(String input)
{
  if (msg_enabled)
  {
    Serial.println(get_runtime(millis()) + "Warn:\t" + input);
  }
}


/*! ******************************************************************************************
 *  @brief Sends a debug message, by prepending the debug prefix and timestamp. Terminated by
 *  "\n".
 *
 *  @param[in] input                   - The string to send after the debug prefix
 *
 *********************************************************************************************/
void Serial_Module::debugMsg(String input)
{
  if (debug_enabled && msg_enabled)
  {
    Serial.println(get_runtime(millis()) + "Debug:" + input);
  }
}


/*! ******************************************************************************************
 *  @brief Sends a sample over the serial interface.
 *
 *  Samples are sent over the serial interface (38400 baud) in the format <sample ID>
 *  <Channel 1><Channel 2><Channel 3>...<Channel 8><\n>. Everything except the \n are
 *  uint32_ts in 8 data bits, no parity, 1 stop bit.
 *
 *  @param[in] input_sample            - The sample to send over the serial interface
 *
 *********************************************************************************************/
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
  Serial.print('\n');
  return true;
}


/*! ******************************************************************************************
 *  @brief Sends a sample from Channel 1 over the serial interface.
 *
 *  Samples are sent over the serial interface (38400 baud) in the format <sample ID>
 *  <Channel 1><\n>. Everything except the \n are uint32_ts in 8 data bits, no parity,
 *  1 stop bit.
 *
 *  @param[in] input_sample            - The sample to send over the serial interface
 *
 *********************************************************************************************/
bool Serial_Module::send_single_channel_sample(Sample_Data_t input_sample)
{
  if (!Serial)
  {
    warningMsg("Serial not available!");
    return false;
  }
  Serial.print(input_sample.id);
  Serial.print(input_sample.Channel_Data[0]);
  Serial.print('\n');
  return true;
}


/*! ******************************************************************************************
 *  @brief Builds the runtime into a timestamp string
 *
 *  @param[in] time_ms                 - The runtime in milliseconds
 *
 *********************************************************************************************/
String Serial_Module::get_runtime(unsigned long time_ms)
{
  unsigned int time_s = time_ms / 1000;
  unsigned int time_m = time_s / 60;
  unsigned int time_h = time_m / 60;

  return(String(time_h) + String(":") + String(time_m) + String(":") + String((double)time_ms / 1000, 3) + String(":\t"));
}
