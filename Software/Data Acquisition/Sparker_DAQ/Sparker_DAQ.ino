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

#include "ADS1299.h"
#include "DAQ_Pin_Map.h"

/*! ******************************************************************************************
 *  @brief Sets up the ADS1299 and required interfaces.
 *
 *********************************************************************************************/
void setup()
{
  /* TEST CODE */
  Serial.begin(9600);
  DAQ_Pin_Map *Hardware_Map = new DAQ_Pin_Map();


  ADS1299_Module *ADS1299 = new ADS1299_Module(Hardware_Map);


  Serial.println("DAQ Hardware Interaction Module Initialised!");
  Serial.println("ADS1299 Module Initialised!");
  Serial.print("The default value of CH8SET is ");
  Serial.println(ADS1299->get_value(CH8SET));
  Serial.println("Setting CH8SET to 40");
  ADS1299->set_value(CH8SET, 40);
  Serial.print("The new value of CH8SET is ");
  Serial.println(ADS1299->get_value(CH8SET));
  Serial.println("Lighting up Status LED");
  digitalWrite(Hardware_Map->Pin_Array[STATUS_LED].Pin, HIGH);
  Serial.println("LED is on");

  /* End test code */


  /* Configure the ADC for the recording montage */
  ADS1299->reset();                                                                                /* Reset device */
//  ADS1299->send_command(SDATAC);                                                                   /* Device defaults to continuous recording mode */
//  ADS1299->write_register(CONFIG3, 0x40);                                                          /* Enable internal reference */
//  ADS1299->write_register(CONFIG1, 0x96);                                                          /* Set device to 250 SPS */
//  ADS1299->write_register(CH1SET, 0x60);                                                           /* Set channel 1 gain as 24 */
//  ADS1299->write_register(CH2SET, 0x81);                                                           /* Disable channel 2 */
//  ADS1299->write_register(CH3SET, 0x81);                                                           /* Disable channel 3 */
//  ADS1299->write_register(CH4SET, 0x81);                                                           /* Disable channel 4 */
//  ADS1299->write_register(CH5SET, 0x81);                                                           /* Disable channel 5 */
//  ADS1299->write_register(CH6SET, 0x81);                                                           /* Disable channel 6 */
//  ADS1299->write_register(CH7SET, 0x81);                                                           /* Disable channel 7 */
//  ADS1299->write_register(CH8SET, 0x81);                                                           /* Disable channel 8 */
//  ADS1299->write_register(MISC1, 0x20);                                                            /* Connect all channel negative rails to reference electrode */
//  ADS1299->send_command(STANDBY);                                                                  /* Put device into standby mode. Will probably delete this later, or replace with a start command */
}


/*! ******************************************************************************************
 *  @brief The main program loop. Plays all the jazz.
 *
 *********************************************************************************************/
void loop()
{
  /* put your main code here, to run repeatedly: */
}
