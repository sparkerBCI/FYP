/*! ******************************************************************************************
 *  @file Sparker_DAQ.ino
 *
 *  @brief The main file for the Sparker DAQ.
 *
 *  Everything starts here. Gets the hardware info from the DAQ_Pin_Map class, and creates a
 *  ADS1299_Module for working with the ADC. Also opens the UART connection for talking over
 *  USB or Bluetooth.
 *
 *  @author Sam Parker
 *
 *  Copyright (c) Sam Parker. 2020. All rights reserved.
 *
 *********************************************************************************************/

/*! ******************************************************************************************
 *  @mainpage The Sparker Wireless EEG Data Acquisition System
 *
 *  @author Sam Parker
 *  @version 0.01
 *
 *  @section intro_sec Introduction
 *  This is the software for the Sparker Wireless EEG Data Acqusition System. It was developed
 *  by Sam Parker as part of his Electrical Engineering Final Year Project at the University
 *  of Newcastle, Australia. This software contains interface functions to set-up, configure,
 *  and operate a Texas Instruments ADS1299 EEG Analog Front End device. It then pipes the data
 *  to a serial port (USB or Bluetooth).
 *
 *  @section mech Mechanics
 *  The software is relatively simple. It instantiates a Pin_Map, which tells the device how
 *  the pins are mapped. If this software is being run on a board other than the Sparker
 *  Data Acquisition System, you need to check the Pin_Map is still correct. It then uses
 *  the Pin_Map to communicate with the ADS1299 over an SPI interface. The device is configured
 *  for the Sparker Data Acquisition board, so if it is to be used with a different recording
 *  montage, new data rate, etc. the setup process will need to be altered.
 *********************************************************************************************/

#include "ADS1299.h"
#include "DAQ_Pin_Map.h"
#include "Serial_Module.h"


DAQ_Pin_Map    *Hardware_Map;
ADS1299_Module *ADS1299;
Serial_Module  *Comms;


/*! ******************************************************************************************
 *  @brief Sets up the ADS1299 and required interfaces.
 *
 *********************************************************************************************/
void setup()
{
  Hardware_Map = new DAQ_Pin_Map();

  ADS1299 = new ADS1299_Module(Hardware_Map);

  Comms = new Serial_Module();

  Comms->msg_enabled   = true;
  Comms->debug_enabled = true;

#ifndef NO_SPI
  if (ADS1299->get_device_id() != VALID_DEVICE_ID)
  {
    Serial.println("Error: Device ID Invalid!");
    while (1)
    {
    }
  }
  if (ADS1299->get_num_channels() == 0)
  {
    Serial.println("Error: Invalid Number of Channels!");
    while (1)
    {
    }
  }


  /* Set up ADS1299 */
  ADS1299->set_reference_buffer_state(true);                              /* Enable internal reference */
  ADS1299->set_data_rate(SPS250);                                         /* Set device to 250 SPS */

  /* Set Up Channel 1 */
  ADS1299->set_channel_gain(CH1, PGA24);                                  /* Set channel 1 gain as 24 */
  ADS1299->set_channel_connection_type(CH1, CH_ELECTRODE_INPUT);          /* Set channel 1 as an electrode input */

  /* Set Up Channel 2 */
  ADS1299->set_channel_power_state(CH2, CH_POWER_OFF);                    /* Turn off Channel 2 */
  ADS1299->set_channel_connection_type(CH2, CH_SHORTED);                  /* Short Channel 2 to power */

  /* Set Up Channel 3 */
  ADS1299->set_channel_power_state(CH3, CH_POWER_OFF);                    /* Turn off Channel 3 */
  ADS1299->set_channel_connection_type(CH3, CH_SHORTED);                  /* Short Channel 3 to power */

  /* Set Up Channel 4 */
  ADS1299->set_channel_power_state(CH4, CH_POWER_OFF);                    /* Turn off Channel 4 */
  ADS1299->set_channel_connection_type(CH4, CH_SHORTED);                  /* Short Channel 4 to power */

  /* Set Up Channel 5 */
  ADS1299->set_channel_power_state(CH5, CH_POWER_OFF);                    /* Turn off Channel 5 */
  ADS1299->set_channel_connection_type(CH5, CH_SHORTED);                  /* Short Channel 5 to power */

  /* Set Up Channel 6 */
  ADS1299->set_channel_power_state(CH6, CH_POWER_OFF);                    /* Turn off Channel 6 */
  ADS1299->set_channel_connection_type(CH6, CH_SHORTED);                  /* Short Channel 6 to power */

  /* Set Up Channel 7 */
  ADS1299->set_channel_power_state(CH7, CH_POWER_OFF);                    /* Turn off Channel 7 */
  ADS1299->set_channel_connection_type(CH7, CH_SHORTED);                  /* Short Channel 7 to power */

  /* Set Up Channel 8 */
  ADS1299->set_channel_power_state(CH8, CH_POWER_OFF);                    /* Turn off Channel 8 */
  ADS1299->set_channel_connection_type(CH8, CH_SHORTED);                  /* Short Channel 8 to power */

  /* Set Up Reference Channel */
  ADS1299->set_all_channel_SRB1_connection_status(SRB1_CLOSED_ALL_CHANNELS); /* Reference all channels to the reference electrode */
  ADS1299->send_command(STANDBY);                                         /* Put device into standby mode. Will probably delete this later, or replace with a start command */
#endif
  unsigned long last_toggle_millis = 0;
  ADS1299->send_command(START);
}


/*! ******************************************************************************************
 *  @brief The main program loop. Plays all the jazz.
 *
 *********************************************************************************************/
void loop()
{
  /* put your main code here, to run repeatedly: */
  if (ADS1299->is_running)
  {
    toggleLED();

    /* To do: Implement data reading */
  }
}


void toggleLED(void)
{
  static unsigned long last_toggle_millis = 0;

  if (!(millis() % 500) && (millis() > (last_toggle_millis + 50)))
  {
    last_toggle_millis = millis();
    Comms->debugMsg("Toggling");
//  Hardware_Map->toggle_pin(STATUS_LED);
//  Hardware_Map->update_pins();
  }
}
