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
 *  @version 0.03
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
 *  montage, new data rate, etc. the setup process will need to be altered. Serial
 *  communications are managed by the Serial Module, which also has debug, warning, and error
 *  messages. These messages should only be used when send data over USB and you will need to
 *  check for the ID byte to distinguish between real data ana a message. If communicating
 *  over bluetooth, or these messages aren't desired, they can be switched off individually.
 *
 *  @section walkthrough Walkthrough of the Read Process
 *  Assuming your device has been set up correctly (big assumption), the main loop checks to
 *  see if the device is running. At this point there is no way to start the device remotely
 *  (i.e. from the host serial device), but I might add this later if I think it is useful. If
 *  the device is running, the status LED will flash. The device will then poll the Data Ready
 *  pin until it goes low, when it issues the RDATA command, which sends 1 sample over the SPI
 *  interface. The sample ID bits are checked to make sure it's not corrupt, then it's
 *  processed and given a sequential sample ID. Sample IDs start at 1, and sample IDs of 0
 *  mean the sample is invalid. But Sam, you say, doesn't that mean that when the Sample IDs
 *  overflow a good sample will be read as invalid? Yes it does. But the sample IDs won't
 *  overflow for 192 days of continuous recording, and if you're running this thing for 192
 *  days you should use a better DAQ system. Valid samples are then sent over the serial
 *  interface (38400 baud) in the format <sample ID><Channel 1><Channel 2><Channel 3>
 *  ...<Channel 8><\n>. Everything except the \n are uint32_ts in 8 data bits, no parity,
 *  1 stop bit. Data is sent MSB first, most significant byte first. It then polls the Data
 *  Ready pin and starts again.
 *********************************************************************************************/

#include "ADS1299.h"
#include "DAQ_Pin_Map.h"
#include "Serial_Module.h"

SoftwareSerial mySS(8, 9);                                                     /**< Creates a UART interface for the Bluetooth Module, RX on 8, TX on 9 */

DAQ_Pin_Map    *Hardware_Map;                                                  /**< This class stores information about how the MCU is connected to the ADC */
ADS1299_Module *ADS1299;                                                       /**< This class enables communication with the ADC */
Serial_Module  *Comms;                                                         /**< This class enables communication with the host device */


/*! ******************************************************************************************
 *  @brief Sets up the ADS1299 and required interfaces.
 *
 *********************************************************************************************/
void setup()
{
  Hardware_Map = new DAQ_Pin_Map();                                            /* Create the Hardware Map, which holds details about how the MCU is connected */

  Comms = new Serial_Module(& mySS);                                           /* Creates the Serial Module, for communication with the host device over bluetooth and USB */

  Comms->msg_enabled   = true;                                                 /* Enables additional messages on the serial bus */
  Comms->debug_enabled = true;                                                 /* Additional enabler for debug messages */

  ADS1299 = new ADS1299_Module(Hardware_Map);                                  /* Creates the ADS1299 Module, for communication and control of the ADC */

  delay(10);                                                                   /* Delay to ensure connection and device power on */

  ADS1299->reset();                                                            /* Restart the device */
  ADS1299->send_command(SDATAC);                                               /* Stop the continuous data conversion (this is default mode on power up) */

  if (ADS1299->get_device_id() != VALID_DEVICE_ID)                             /* If the device gives us an invalid device ID */
  {
    Comms->errorMsg("Device ID Invalid!");                                     /* Send an error */
    while (1)                                                                  /* Wait here forever, there's nothing else we can do, since this program is written for the ADS1299 family */
    {
    }
  }
  if (ADS1299->get_num_channels() == NUM_CHANNELS_ERROR)                       /* If the number of channels reported by the device is invalid */
  {
    Comms->errorMsg("Invalid Number of Channels!");                            /* Send an error */
    while (1)                                                                  /* Wait here forever, there's nothing else we can do, since this program was written for the ADS1299-4, ADS1299-6, or ADS1299 */
    {
    }
  }


  /* Set up ADS1299 */
//  ADS.WREG(CONFIG1, 0b11010110); // Disable daisy chain mode, clock will not ouput on clk pin, data rate 250sps
//  ADS.WREG(CONFIG2, 0xC0); //Disable test signals
//  ADS.WREG(CONFIG3, 0xE0); //Enable internal 4.5V reference. Do not measure bias.
//  ADS.WREG(MISC1, 0x20); //Connect SRB1 to all negative channel pins
//  ADS.WREG(CH1SET, 0x60); //Set as normal electrode input with gain of 24
//  ADS.WREG(CH2SET, 0x81); //power off unused channels and short to power
//  ADS.WREG(CH3SET, 0x81);
//  ADS.WREG(CH4SET, 0x81);
//  ADS.WREG(CH5SET, 0x81);
//  ADS.WREG(CH6SET, 0x81);
//  ADS.WREG(CH7SET, 0x81);
//  ADS.WREG(CH8SET, 0x81);
//  ADS.START();
//  ADS.RDATAC();

  //---------------------------------
  ADS1299->set_daisy_mode(MULTIPLE_READBACK_MODE);                             /* Put the device in multiple readback mode */
  ADS1299->set_clock_mode(false);                                              /* The oscillator will not output onto the CLK pin */
  ADS1299->set_data_rate(SPS250);                                              /* Set the device to 250 samples per second */
  ADS1299->set_int_cal(false);                                                 /* Power down internal test signal generator */
  ADS1299->set_reference_buffer_state(true);                                   /* Enable internal reference */
  ADS1299->set_bias_measurement_state(false);                                  /* Do not measure the bias signal */
  ADS1299->set_all_channel_SRB1_connection_status(SRB1_CLOSED_ALL_CHANNELS);   /* Route the SRB1 signal to all channels' negative inputs */

  /* Set Up Channel 1 */
  ADS1299->set_channel_gain(CH1, PGA24);                                       /* Set channel 1 gain as 24 */
  ADS1299->set_channel_connection_type(CH1, CH_ELECTRODE_INPUT);               /* Set channel 1 as an electrode input */
  /* Set Up Channel 2 */
  ADS1299->set_channel_power_state(CH2, CH_POWER_OFF);                         /* Turn off Channel 2 */
  ADS1299->set_channel_connection_type(CH2, CH_SHORTED);                       /* Short Channel 2 to power */
  /* Set Up Channel 3 */
  ADS1299->set_channel_power_state(CH3, CH_POWER_OFF);                         /* Turn off Channel 3 */
  ADS1299->set_channel_connection_type(CH3, CH_SHORTED);                       /* Short Channel 3 to power */
  /* Set Up Channel 4 */
  ADS1299->set_channel_power_state(CH4, CH_POWER_OFF);                         /* Turn off Channel 4 */
  ADS1299->set_channel_connection_type(CH4, CH_SHORTED);                       /* Short Channel 4 to power */
  /* Set Up Channel 5 */
  ADS1299->set_channel_power_state(CH5, CH_POWER_OFF);                         /* Turn off Channel 5 */
  ADS1299->set_channel_connection_type(CH5, CH_SHORTED);                       /* Short Channel 5 to power */
  /* Set Up Channel 6 */
  ADS1299->set_channel_power_state(CH6, CH_POWER_OFF);                         /* Turn off Channel 6 */
  ADS1299->set_channel_connection_type(CH6, CH_SHORTED);                       /* Short Channel 6 to power */
  /* Set Up Channel 7 */
  ADS1299->set_channel_power_state(CH7, CH_POWER_OFF);                         /* Turn off Channel 7 */
  ADS1299->set_channel_connection_type(CH7, CH_SHORTED);                       /* Short Channel 7 to power */
  /* Set Up Channel 8 */
  ADS1299->set_channel_power_state(CH8, CH_POWER_OFF);                         /* Turn off Channel 8 */
  ADS1299->set_channel_connection_type(CH8, CH_SHORTED);                       /* Short Channel 8 to power */

  /* Confirm requested setup is current */
  check_register(CONFIG1, 0xD6);
  check_register(CONFIG2, 0xC0);
  check_register(CONFIG3, 0xE0);
  check_register(CH1SET, 0x60);
  check_register(CH2SET, 0x81);
  check_register(CH3SET, 0x81);
  check_register(CH4SET, 0x81);
  check_register(CH5SET, 0x81);
  check_register(CH6SET, 0x81);
  check_register(CH7SET, 0x81);
  check_register(CH8SET, 0x81);
  check_register(MISC1, 0x20);


  //---------------------------------
}


/*! ******************************************************************************************
 *  @brief The main program loop. Plays all the jazz.
 *
 *********************************************************************************************/
void loop()
{
  static uint8_t input_buffer[27] = { 0 };                                     /**< A buffer to save data from the ADC to */

  if (ADS1299->is_running)                                                     /* If the ADC is converting */
  {
    toggleLED(500, 50);                                                        /* Flash the LED with a 500ms half period and 50ms debounce period */


    if (digitalRead(Hardware_Map->Pin_Array[NOT_DATA_READY].Pin) == LOW)       /* If the device has data to read */
    {
      ADS1299->read_sample(input_buffer);                                      /* Read data into the input buffer */
      Sample_Data_t this_sample = process_sample(input_buffer);                /* Build a sample structure by processing the input data buffer */
      if (this_sample.id != 0)                                                 /* If the sample was valid (corresponding to a sample ID of something other than 0) */
      {
        if (!(Comms->send_single_channel_sample_Bluetooth(this_sample)))       /* If we don't successfully send the command */
        {
          Comms->warningMsg("Could not send processed sample!");               /* Send a warning */
        }
      }
      else                                                                     /* Otherwise, we must have gotten an invalid sample ID */
      {
        Comms->warningMsg("Invalid Sample ID. This happens if there is a problem, or if the device has been recording for 192 days."); /* Send a warning */
      }
    }
  }
}


/*! ******************************************************************************************
 *  @brief Flashes the Status LED pin at a given frequency.
 *
 *  @param[in] half_period             - Half of the period (so the time the LED will be on /
 *                                       off for) in milliseconds.
 *  @param[in] debounce_ms             - The time to wait between successive function calls.
 *                                       This is becuase the function may be called more than
 *                                       once a millisecond. Really, this value could be 1ms
 *                                       and everything will still be peachy. This way you can
 *                                       say 0ms and figure out how many times per ms the main
 *                                       loop runs by probing the status LED pin.
 *
 *********************************************************************************************/
void toggleLED(uint16_t half_period, uint8_t debounce_ms)
{
  static unsigned long last_toggle_millis = 0;                                 /**< The millisecond runtime that the LED was last toggled at */


  if (!(millis() % half_period) && (millis() > (last_toggle_millis + debounce_ms))) /* If the half period has expired and we're out of the debounce period */
  {
    last_toggle_millis = millis();                                             /* Save the last toggle time */
    Comms->debugMsg("Toggling");                                               /* Send a debug message */
    Hardware_Map->toggle_pin(STATUS_LED);                                      /* Toggle the status LED */
    // Hardware_Map->update_pins();                                               /* Update the pin values in the pin array */
    if (last_toggle_millis > (0xFFFFFFFF - (half_period)))                     /* If next time we need to toggle millis() will have overflowed */
    {
      last_toggle_millis = 0;                                                  /* Reset the last toggle time to 0 */
    }
  }
}


/*! ******************************************************************************************
 *  @brief Processes the input data buffer and parses it into a structure.
 *
 *  Sample IDs start at 1. 0 is an invalid sample ID. This will overflow after 192 days of
 *  continuous recording.
 *
 *  @param[in] input_buffer            - The input data buffer from the ADC
 *
 *  @return Sample_Data_t              - A structure containing the parsed data. All fields
 *                                       are 0 if error.
 *
 *********************************************************************************************/
Sample_Data_t process_sample(uint8_t *input_buffer)
{
  static uint32_t sample_ID        = 1;                                        /**< A running tally of samples */
  Sample_Data_t   processed_sample = { 0, 0, 0, 0, { 0 } };                    /* Initialise the structure to 0. This is the invalid state */

  if (input_buffer == nullptr)                                                 /* If the input buffer is a nullptr */
  {
    Comms->errorMsg("Can't process nullptr sample buffer!");                   /* Send an error */
    return processed_sample;                                                   /* Return the invalid structure */
  }

  if ((input_buffer[0] >> 4) != 0x0C)                                          /* If the data buffer does not start with the correct bit sequence */
  {
    Comms->warningMsg("Corrupt Sample! Skipping.");                            /* Send a warning and skip this sample */
    sample_ID++;                                                               /* We still increase the sample ID though, since we read data from the device (taking up 1 sample per second spot), it was just bad data */
    return processed_sample;                                                   /* Return the invalid structure */
  }

  processed_sample.id = sample_ID;                                             /* Save the sample ID into the structure */
  sample_ID++;                                                                 /* Increment the sample ID so the next sample gets a new ID */

  uint8_t temp_loff_p = input_buffer[0] << 4;                                  /* Move the lower nibble of the first byte into the upper nibble */
  uint8_t temp_loff_n = input_buffer[1] >> 4;                                  /* Move the upper nibble of the second byte into the lower nibble */
  processed_sample.Positive_Lead_Off_Status = temp_loff_p | temp_loff_n;       /* OR these values to combine the nibbles into a whole byte */

  temp_loff_n = input_buffer[1] << 4;                                          /* Move the lower nibble of the second byte into the upper nibble */
  uint8_t temp_gpio = input_buffer[2] >> 4;                                    /* Move the upper nibble of the third byte into the lower nibble */
  processed_sample.Negative_Lead_Off_Status = temp_loff_n | temp_gpio;         /* OR these values to combine the nibbles into a whole byte */

  processed_sample.GPIO_Data = input_buffer[2] & 0x0F;                         /* Get the lower nibble of the third byte, this is the GPIO states */

  /* Now process channel data */
  for (uint8_t current_channel = 0; current_channel < CH_ERROR; current_channel++) /* Until we have looked at all channels */
  {
    uint32_t data[3] = { 0 };                                                  /* Each channel reports 24 bits of data (3 bytes), and we need to bitshift, so make a buffer to store these values */
    for (uint8_t current_byte = 0; current_byte < 3; current_byte++)           /* Until we have looked at all 3 bytes for each channel */
    {
      data[current_byte] = input_buffer[(3 + current_byte) + 3 * current_channel]; /* Read the bytes for each channel in order */
    }
    processed_sample.Channel_Data[current_channel] = (data[0] << 16) | (data[1] << 8) | data[2]; /* The first byte holds bits 16 to 23, so bitshift 16. The second byte holds bits 8 to 15, so bitshift 8, and the last byte holds bits 0 through 7, so don't bitshift. OR them all together, and you have a 24 bit sample */
  }

  return processed_sample;                                                     /* Return the valid sample */
}


/*! ******************************************************************************************
 *  @brief Compares the value reported by the ADS1299 to the expected value and prints
 *  the status on the Serial interface.
 *
 *  @param[in] reg                     - The register to compare
 *  @param[in] expected_value          - The value the user is expecting the register to return.
 *
 *********************************************************************************************/
void check_register(Reg_ID_t reg, uint8_t expected_value)
{
  uint8_t reg_data = 0;

  reg_data = ADS1299->read_register(reg);
  if (reg_data != expected_value)
  {
    Serial.print(ADS1299->Reg_Array[reg].Register_Name);
    Serial.print(" SET INCORRECTLY! EXPECTED ");
    Serial.print(expected_value, HEX);
    Serial.print(", ACTUAL: ");
  }
  else
  {
    Serial.print(ADS1299->Reg_Array[reg].Register_Name);
    Serial.print(" set correctly: ");
  }
  Serial.println(reg_data, HEX);
}
