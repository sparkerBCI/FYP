#include "ADS1299.h"
#include "DAQ_Pin_Map.h"

/** ****************************************************************************************
 *  @mainpage The Sparker Wireless EEG Data Acquisition System
 *  
 *  @author Sam Parker
 *  @version $ID: $
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
 */

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
  ADS1299->send_command(SDATAC);                                                                   /* Device defaults to continuous recording mode */
  ADS1299->write_register(CONFIG3, 0x40);                                                          /* Enable internal reference */
  ADS1299->write_register(CONFIG1, 0x96);                                                          /* Set device to 250 SPS */
  ADS1299->write_register(CH1SET, 0x60);                                                           /* Set channel 1 gain as 24 */
  ADS1299->write_register(CH2SET, 0x81);                                                           /* Disable channel 2 */
  ADS1299->write_register(CH3SET, 0x81);                                                           /* Disable channel 3 */
  ADS1299->write_register(CH4SET, 0x81);                                                           /* Disable channel 4 */
  ADS1299->write_register(CH5SET, 0x81);                                                           /* Disable channel 5 */
  ADS1299->write_register(CH6SET, 0x81);                                                           /* Disable channel 6 */
  ADS1299->write_register(CH7SET, 0x81);                                                           /* Disable channel 7 */
  ADS1299->write_register(CH8SET, 0x81);                                                           /* Disable channel 8 */
  ADS1299->write_register(MISC1, 0x20);                                                            /* Connect all channel negative rails to reference electrode */
  ADS1299->send_command(STANDBY);                                                                  /* Put device into standby mode. Will probably delete this later, or replace with a start command */
}


void loop()
{
  /* put your main code here, to run repeatedly: */
}
