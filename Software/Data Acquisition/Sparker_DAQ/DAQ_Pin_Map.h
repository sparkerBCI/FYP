/*! ******************************************************************************************
 *  @file DAQ_Pin_Map.h
 *
 *  @brief This file holds declarations for functions to interact with the hardware on a pin
 *  level.
 *
 *  It also assigns names and IDs to often-used pins. Rather than conducting a
 *  digital read every time we need to query a pin status, and to allow for batch pin changes,
 *  a local copy of the pin states are kept in the Pin_Array. If a pin state changes in the
 *  array, it will be marked as dirty, then when an update is called, all the dirty pins will
 *  be actually digitally written. This introduces some complexity, as if we query the state of
 *  a pin before issuing an update, the array will hold different data to what is actually on the
 *  pin, so we need to flip it. I might remove this, and have the set_state function perform the
 *  digital write itself, but for now it's staying.
 *
 *  @author Sam Parker
 *
 *  Copyright (c) Sam Parker 2020 <br/> All rights reserved.
 *
 *********************************************************************************************/

#ifndef DAQ_PIN_MAP_H
#define DAQ_PIN_MAP_H

#include <Arduino.h>
#include <SPI.h>

/* #define all the pins */

/* *INDENT-OFF* */
/*! ******************************************************************************************
 *
 *  @brief The Pin_Table holds information about the often used pins, which is used to generate
 *  the Pin_Array.
 *  
 *  Column A: Pin_ID: The unique identifier for each pin
 *  Column B: Pin: The physical pin number of the pin
 *  Column C: Mode: The IO Mode of the pin
 *  Column D: Name: A readable name for the pin
 *  Column F: State: The default states of the pins. Not used for input pins.
 *
 *********************************************************************************************/
#define PIN_TABLE                                                                                          \
   /*               a                b             c                  d                e*/                 \
   PIN_ENTRY(NOT_CHIP_SELECT,        4,         OUTPUT,         "Chip Select",       HIGH)                 \
   PIN_ENTRY(DAQ_SCLK,              13,         OUTPUT,    "SPI Serial Clock",        LOW)                 \
   PIN_ENTRY(DAQ_MISO,              12,         OUTPUT,            "SPI MISO",        LOW)                 \
   PIN_ENTRY(DAQ_MOSI,              11,          INPUT,            "SPI MOSI",        LOW)                 \
   PIN_ENTRY(START_PIN,              7,         OUTPUT,               "Start",        LOW)                 \
   PIN_ENTRY(NOT_DATA_READY,         6,          INPUT,          "Data Ready",       HIGH)                 \
   PIN_ENTRY(NOT_POWER_DOWN,         5,         OUTPUT,          "Power Down",       HIGH)                 \
   PIN_ENTRY(STATUS_LED,             3,         OUTPUT,          "Status LED",        LOW)
/* *INDENT-ON* */

/*! ******************************************************************************************
 *  @brief This enum assigns a unique identifier for each Pin_ID in the Pin Table
 *
 *********************************************************************************************/
typedef enum Pin_ID_t
{
#define PIN_ENTRY(a, b, c, d, e)    a,
  PIN_TABLE
#undef PIN_ENTRY
  NUM_PINS
} Pin_ID_t;

/*! ******************************************************************************************
 *  @brief The DAQ_Pin_Map class contains methods for interacting with the pins of the MCU.
 *
 *********************************************************************************************/
class DAQ_Pin_Map {
public:

/*! ******************************************************************************************
 *  @brief Constructs a new DAQ_Pin_Map and sets pins to their correct pin mode, then writes
 *  the default states to each pin.
 *
 *********************************************************************************************/
  explicit DAQ_Pin_Map();

/*! ******************************************************************************************
 *  @brief Changes the state of the pin in the pin array, and marks it for updating.
 *
 *  Note, this does not actually update the state of the physical pin, and an update must be
 *  called to actually push this change onto the pin.
 *
 *  @param[in] pin                  - The Pin_ID_t of the pin to change
 *  @param[in] state                - The new state of the pin
 *
 *********************************************************************************************/
  void set_state(Pin_ID_t pin, uint8_t state);

/*! ******************************************************************************************
 *  @brief Gets the state of the pin, as stored in the pin array.
 *
 *  Doesn't work well for input pins, as these pins are changed by external factors. Also is
 *  more complex than it should be, as pins that changed before calling an update will need
 *  to be flipped to get the actual pin state.
 *
 *  @param[in] pin                  - The Pin_ID_t of the pin to check
 *
 *  @return uint8_t                 - The state of the pin, as stored in the Pin_Array
 *
 *********************************************************************************************/
  uint8_t get_state(Pin_ID_t pin);

/*! ******************************************************************************************
 *  @brief Toggles the state of a pin in the Pin Array and marks the pin for an update.\
 *  
 *  @param[in] pin                  - The Pin_ID_t of the pin to toggle
 *
 *********************************************************************************************/
  void toggle_pin(Pin_ID_t pin);

/*! ******************************************************************************************
 *  @brief Toggles the state of a pin given the name of a pin. This is slow, and should only 
 *  be used for non-time critical applications (e.g. indicator LEDs, not trigger signals).
 *
 *********************************************************************************************/
  //void toggle_pin_by_name(char const * pin_name) = 0;

/*! ******************************************************************************************
 *  @brief This struct contains information for each entry in the Pin Array.
 *
 *********************************************************************************************/
  typedef struct Pin_Array_t
  {
    Pin_ID_t   Pin_ID;                                                         /**< The unique ID for each pin */
    uint8_t    Pin;                                                            /**< The physical pin number of the pin */
    uint8_t    Mode;                                                           /**< The IO mode of the pin */
    char const *Name;                                                          /**< A human readable name for the pin */
    uint8_t    State;                                                          /**< The current state of the pin */
  } Pin_Array_t;

/* Create the register array and populate the value with default value */
#define PIN_ENTRY(a, b, c, d, e)    { a, b, c, d, e},                          /**< Creates the Pin Array and fills it with the default values from the Pin Table. Defaults Changed to false */
  Pin_Array_t Pin_Array[NUM_PINS] = { PIN_TABLE };
#undef PIN_ENTRY

  const long long SPI_SPEED_HZ = 4000000;                                      /**< The maximum SPI speed in Hz */
  const int SPI_ENDIAN         = MSBFIRST;                                     /**< The SPI bit order */
  const int SPI_MODE           = SPI_MODE1;                                    /**< The SPI mode */
};


#endif
