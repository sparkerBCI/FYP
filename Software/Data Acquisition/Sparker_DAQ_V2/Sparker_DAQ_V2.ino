/*! ******************************************************************************************
 *  @file Sparker_DAQ_V2.ino
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
 *  @version 2.03
 *
 *  @section intro_sec Introduction
 *  This is the software for the Sparker Wireless EEG Data Acquisition System. It was developed
 *  by Sam Parker as part of his Electrical Engineering Final Year Project at the University
 *  of Newcastle, Australia. This software contains interface functions to set-up, configure,
 *  and operate a Texas Instruments ADS1299 EEG Analog Front End device. It then pipes the data
 *  to a serial port (USB or Bluetooth).
 *  
 *  @section pinout Arduino Pinout
 *  <table style="width:100%">
 *   <tr>
 *     <th>Pin Name</th>
 *     <th>Pin</th>
 *     <th>Function</th>
 *   </tr>
 *   <tr>
 *     <td>SCLK</td>
 *     <td>13</td>
 *     <td>SPI Clock Output</td>
 *   </tr>
 *   <tr>
 *     <td>MISO</td>
 *     <td>12</td>
 *     <td>Data from Slave (ADS1299) to Master (Arduino)</td>
 *   </tr>
 *   <tr>
 *     <td>MOSI</td>
 *     <td>11</td>
 *     <td>Data from Master (Arduino) to Slave (ADS1299)</td>
 *   </tr>
 *   <tr>
 *     <td>DRDY</td>
 *     <td>6</td>
 *     <td>Signal from ADS1299 that data is ready to read</td>
 *   </tr>
 *   <tr>
 *     <td>CS</td>
 *     <td>4</td>
 *     <td>Selects which slave device to communicate with</td>
 *   </tr>
 *   <tr>
 *     <td>Status</td>
 *     <td>3</td>
 *     <td>A pin that is toggled when the data is being read</td>
 *   </tr>
 * </table>
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
 *  interface (38400 baud) in the format (sample ID)(Channel 1)(Channel 2)(Channel 3)
 *  ...(Channel 8)(\\n). Everything except the \\n are uint32_ts in 8 data bits, no parity,
 *  1 stop bit. Data is sent MSB first, most significant byte first. It then polls the Data
 *  Ready pin and starts again.
 *********************************************************************************************/

#include "ADS1299.h"
#include <SoftwareSerial.h>

//RX, TX
SoftwareSerial Bluetooth(8, 9);                                                       /**< Creates a UART interface for the Bluetooth Module, RX on 8, TX on 9 */

ADS1299 ADS;                                                                          /**< This class enables communication with the ADC */
boolean deviceIDReturned = false;                                                    /**< A flag to indicate whether the device ID has been returned from the ADS1299 */
boolean startedLogging = false;                                                      /**< A flag to indicate whether logging data has started */                                                              
long epoch[256] = {0};

/*! ******************************************************************************************
 *  @brief Sets up the serial and bluetooth links, establishes and checks
 *  connection with ADS1299, and configures the ADS1299 as desired.
 *********************************************************************************************/
void setup() {

  /* Set up Serial Comms */
  Serial.begin(115200);
  Bluetooth.begin(38400);

  /* Set up Status Pin */
  pinMode(3, OUTPUT);
  digitalWrite(3, LOW);

  /* Set up ADS1299 and Power On Reset */
  ADS.setup(6, 4); // (DRDY pin, CS pin);
  delay(10);  //delay to ensure connection
  
  ADS.RESET();


   /* Check the Device ID */
   if (ADS.getDeviceID() != 3) {                        /* If the returned device ID is not the expected value */
    Serial.println("Error: Incorrect ID");              /* Tell the user */
    while (1) {}                                        /* Enter an infinite loop, there is nothing else we can do */
   }
   deviceIDReturned = true;                            /* If we get to here, the device ID has been returned successfully */

  ADS.SDATAC();                                        /* The device defaults to continuous read mode. We need to stop this before we can change the registers */
  ADS.WREG(CONFIG1, 0x96);                             /* Set the data rate to 250sps */
  ADS.WREG(CONFIG2, 0xC0);                             /* Disable test signals */
  ADS.WREG(CONFIG3, 0xE0);                             /* Internal reference on, bias generator off */
  ADS.WREG(MISC1, 0x20);                               /* Connect SRB1 to all negative channel pins */
  ADS.WREG(CH1SET, 0x60);                              /* Set as normal electrode input with gain of 24 */
  ADS.WREG(CH2SET, 0x81);                              /* Power off unused channels and short to AVDD */
  ADS.WREG(CH3SET, 0x81);
  ADS.WREG(CH4SET, 0x81);
  ADS.WREG(CH5SET, 0x81);
  ADS.WREG(CH6SET, 0x81);
  ADS.WREG(CH7SET, 0x81);
  ADS.WREG(CH8SET, 0x81);

  /* Confirm requested setup is current */
  check_register(CONFIG1, 0x96);                      /* Compare CONFIG1 register value to expected value */
  check_register(CONFIG2, 0xC0);                      /* Compare CONFIG2 register value to expected value */
  check_register(CONFIG3, 0xE0);                      /* Compare CONFIG3 register value to expected value */
  check_register(CH1SET, 0x60);                      /* Compare CH1SET register value to expected value */
  check_register(CH2SET, 0x81);                      /* Compare CH2SET register value to expected value */
  check_register(CH3SET, 0x81);                      /* Compare CH3SET register value to expected value */
  check_register(CH4SET, 0x81);                      /* Compare CH4SET register value to expected value */
  check_register(CH5SET, 0x81);                      /* Compare CH5SET register value to expected value */
  check_register(CH6SET, 0x81);                      /* Compare CH6SET register value to expected value */
  check_register(CH7SET, 0x81);                      /* Compare CH7SET register value to expected value */
  check_register(CH8SET, 0x81);                      /* Compare CH8SET register value to expected value */
  check_register(MISC1, 0x20);                      /* Compare MISC1 register value to expected value */

  Serial.println("Device Configuration Complete!");  /* Tell the user the device has been set up */

 
  ADS.RDATAC();                                        /* Start continuous conversion */
  
}

/*! ******************************************************************************************
 *  @brief The main loop. Plays all the jazz.
 *********************************************************************************************/
void loop(){
  static long samp_num = 0;                           /* Track the sample number we are looking at */
  static unsigned long last_transmission = millis();
   static long data;                                  /* Create a single variable to hold a single sample in */
  static unsigned long epoch_time;
    data = ADS.updateData();                         /* Read the channel 1 data from the device if it is available */
    if (data != -1 && samp_num < 256) {              /* If there was data to read and space in the epoch buffer */ 
      epoch[samp_num] = data;
      samp_num++;
    }
     if ((millis() - last_transmission) >= 1000) {
       for (unsigned int i = 0; i < samp_num; i++) {
          char sample[12] = {0};
          snprintf(sample, 12, "%010ld\n", epoch[i]);         /* Save the data as a string for communication over the serial bus */
          Bluetooth.print(sample);                         /* Output the data over the serial bus */
          Serial.print(sample);
       }
       samp_num = 0;
       last_transmission = millis();
    }
    flash_LED(500);                                /* We want to toggle the status LED every 500ms */
  
}


/*! ******************************************************************************************
 *  @brief Compares the value of a register to the expected value.
 *  
 *  Prints result to the screen.
 *  
 *  @param[in] reg               - A byte holding the address of a register to check,
 *  @param[in] expected_value    - The desired value of that register
 *********************************************************************************************/
void check_register(byte reg, uint8_t expected_value)
{
  uint8_t reg_data = 0;                                /* A place to store the data we read from  the device */

  reg_data = ADS.RREG(reg);                               /* Read the value of the desired register from the device */
  ADS.printRegisterName(reg);                             /* Print the register name in preparation for the rest of the message */
  if (reg_data != expected_value)                         /* If the value we got back wasn't what we expected */
  {
    Serial.print(" SET INCORRECTLY! EXPECTED ");         /* Tell the user the register was set incorrectly */
    Serial.print(expected_value, HEX);                   /* Tell the user what the expected value was */
    Serial.print(", ACTUAL: ");                          /* Prepare to tell the user what the actual value is */
  }
  else                                                   /* Otherwise the register must be set correctly */
  {
    Serial.print(" set correctly: ");                    /* Tell the user the register was set correctly */
  }
  Serial.println(reg_data, HEX);                        /* Display the current value of the register */
}

/*! ******************************************************************************************
 *  @brief Toggles an LED to make a square wave at the provided half-period
 * 
 *  @param[in] half_period            - Half of the full wave period of the desired square wave
 *********************************************************************************************/
void flash_LED(unsigned int half_period) {
  static unsigned long last_toggle_millis = millis();        /* A variable to store when the pin last toggled, even across function calls. Initialise to first function call */

  if((millis() - last_toggle_millis) >= half_period) {            /* If the current runtime is longer or equal to the half period of the desired square wave */
    digitalWrite(3, !digitalRead(3));                            /* Toggle the pin */
    last_toggle_millis = millis();                              /* Save the time that the pin was last toggled */
  } 
}
