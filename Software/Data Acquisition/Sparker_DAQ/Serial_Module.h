/*! ******************************************************************************************
 *  @file Serial_Module.h
 *
 *  @brief This file holds declarations for functions to communicate over the serial
 *  interface.
 *
 *  This includes Error, Warning, and Debug messages, which are formatted to include
 *  the runtime (HH:MM:SS.MS format). These messages can be globally enabled by setting
 *  msg_enabled to true. Debug messages require an additional setting of debug_enabled to
 *  true.
 *
 *  @author Sam Parker
 *
 *  Copyright (c) Sam Parker 2020 <br/> All rights reserved.
 *
 *********************************************************************************************/

#ifndef SERIAL_MODULE_H
#define SERIAL_MODULE_H

#include <Arduino.h>

#define MAX_ADC_CHANNELS    8                                                  /**< The maximum number of channels to send over the serial interface */

/*! ******************************************************************************************
 *  @brief This structure holds all the info to transmit for a single sample.
 *
 *********************************************************************************************/
typedef struct Sample_Data_t
{
  uint32_t id;                                                                 /**< The unique sample ID of this sample */
  uint8_t  Positive_Lead_Off_Status;                                           /**< The positive lead off status for each channel */
  uint8_t  Negative_Lead_Off_Status;                                           /**< The negative lead off status for each channel */
  uint8_t  GPIO_Data;                                                          /**< The state of the GPIO pins */
  uint32_t Channel_Data[MAX_ADC_CHANNELS];                                     /**< An array of data for each channel. Entry 0 is Channel 1 */
} Sample_Data_t;

/*! ******************************************************************************************
 *  @brief This class facilitates communication over the serial interface.
 *
 *********************************************************************************************/
class Serial_Module {
public:

/*! ******************************************************************************************
 *  @brief Constructs a new Serial Module with a baud rate of 38400.
 *
 *********************************************************************************************/
  explicit Serial_Module();

/*! ******************************************************************************************
 *  @brief Sends a given string over the UART interface. Terminated by "\n".
 *
 *  @param[in] input                   - The string to send
 *
 *********************************************************************************************/
  void send_line(String input);

/*! ******************************************************************************************
 *  @brief Sends an error message, by prepending the error prefix and timestamp. Terminated
 *  by "\n".
 *
 *  @param[in] input                   - The string to send after the error prefix
 *
 *********************************************************************************************/
  void errorMsg(String input);

/*! ******************************************************************************************
 *  @brief Sends a warning message, by prepending the warning prefix and timestamp. Terminated
 *  by "\n".
 *
 *  @param[in] input                   - The string to send after the warning prefix
 *
 *********************************************************************************************/
  void warningMsg(String input);

/*! ******************************************************************************************
 *  @brief Sends a debug message, by prepending the debug prefix and timestamp. Terminated by
 *  "\n".
 *
 *  @param[in] input                   - The string to send after the debug prefix
 *
 *********************************************************************************************/
  void debugMsg(String input);

/*! ******************************************************************************************
 *  @brief Sends a sample over the serial interface.
 *
 *  Samples are sent over the serial interface (38400 baud) in the format <sample ID>
 *  <Channel 1><Channel 2><Channel 3>...<Channel 8><0xFF>. Everything except the 0xFF are
 *  uint32_ts in 8 data bits, no parity, 1 stop bit. It then polls the Data Ready pin and
 *  starts again.
 *
 *  @param[in] input_sample            - The sample to send over the serial interface
 *
 *********************************************************************************************/
  bool send_sample(Sample_Data_t input_sample);

/*! ******************************************************************************************
 *  @brief Builds the runtime into a timestamp string
 *
 *  @param[in] time_ms                 - The runtime in milliseconds
 *
 *********************************************************************************************/
  String get_runtime(unsigned long time_ms);

  bool debug_enabled = false;                                                  /**< A flag to enable debug messages if messages are enabled */
  bool msg_enabled   = false;                                                  /**< A flag to enable messages on the serial bus */
};

#endif
