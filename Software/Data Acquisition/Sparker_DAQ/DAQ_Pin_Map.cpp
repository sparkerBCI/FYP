/*! ******************************************************************************************
 *  @file DAQ_Pin_Map.cpp
 *
 *  @brief This file holds implentations for functions to interact with the hardware on a pin
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

#include "DAQ_Pin_Map.h"


/*! ******************************************************************************************
 *  @brief Constructs a new DAQ_Pin_Map and sets pins to their correct pin mode, then writes
 *  the default states to each pin.
 *
 *********************************************************************************************/
DAQ_Pin_Map::DAQ_Pin_Map()
{
  /* Set up pinModes */
  for (uint8_t current_pin = NOT_CHIP_SELECT; current_pin < NUM_PINS; current_pin++)
  {
    pinMode(Pin_Array[current_pin].Pin, Pin_Array[current_pin].Mode);
    if (Pin_Array[current_pin].Mode == OUTPUT)
    {
      digitalWrite(Pin_Array[current_pin].Pin, Pin_Array[current_pin].State);
    }
  }
}


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
void DAQ_Pin_Map::set_state(Pin_ID_t pin, uint8_t state)
{
  if ((pin >= NOT_CHIP_SELECT) &&
      (pin < NUM_PINS) &&
      ((state == HIGH) || (state == LOW)) &&
      (Pin_Array[pin].Mode == OUTPUT))
  {
    digitalWrite(Pin_Array[pin].Pin, state);
  }
}


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
uint8_t DAQ_Pin_Map::get_state(Pin_ID_t pin)
{
  if ((pin >= NOT_CHIP_SELECT) &&
      (pin < NUM_PINS))
  {
    return digitalRead(Pin_Array[pin].Pin);
  }
  return 0xFF;
}


/*! ******************************************************************************************
 *  @brief Toggles the state of a pin in the Pin Array and marks the pin for an update.
 *
 *********************************************************************************************/
void DAQ_Pin_Map::toggle_pin(Pin_ID_t pin)
{
  if ((pin >= NOT_CHIP_SELECT) &&
      (pin < NUM_PINS) &&
      (Pin_Array[pin].Mode == OUTPUT))
  {
    digitalWrite(Pin_Array[pin].Pin, !digitalRead(Pin_Array[pin].Pin));
  }
}
