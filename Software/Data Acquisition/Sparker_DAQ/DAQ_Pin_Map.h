#ifndef _DAQ_PIN_MAP_H
#define _DAQ_PIN_MAP_H

#include <Arduino.h>
#include <SPI.h>

/* #define all the pins */

/* *INDENT-OFF* */
#define PIN_TABLE                                                                              \
   /*     a                  b          c               d                   */                 \
   PIN_ENTRY(NOT_CHIP_SELECT,       13,         OUTPUT,         "Chip Select")                 \
   PIN_ENTRY(START_PIN,             11,         OUTPUT,               "Start")                 \
   PIN_ENTRY(NOT_DATA_READY,        10,          INPUT,          "Data Ready")                 \
   PIN_ENTRY(NOT_POWER_DOWN,         9,         OUTPUT,          "Power Down")                 \
   PIN_ENTRY(STATUS_LED,            12,         OUTPUT,          "Status LED")
/* *INDENT-ON* */

typedef enum Pin_ID_t
{
#define PIN_ENTRY(a, b, c, d)    a,
  PIN_TABLE
#undef PIN_ENTRY
  NUM_PINS
} Pin_ID_t;

class DAQ_Pin_Map {
public:
  explicit DAQ_Pin_Map();

  typedef struct Pin_Array_t
  {
    Pin_ID_t   Pin_ID;
    uint8_t    Pin;
    uint8_t    Mode;
    char const *Name;
  } Pin_Array_t;

/* Create the register array and populate the value with default value */
#define PIN_ENTRY(a, b, c, d)    { a, b, c, d },
  Pin_Array_t Pin_Array[NUM_PINS] = { PIN_TABLE };
#undef PIN_ENTRY

  const long long SPI_SPEED_HZ = 4000000;
  const int SPI_ENDIAN         = MSBFIRST;
  const int SPI_MODE           = SPI_MODE1;

private:
};


#endif


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
