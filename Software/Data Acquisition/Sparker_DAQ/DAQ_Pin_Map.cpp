#include "DAQ_Pin_Map.h"

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


void DAQ_Pin_Map::set_state(Pin_ID_t pin, uint8_t state)
{
  if ((pin >= NOT_CHIP_SELECT) &&
      (pin < NUM_PINS) &&
      ((state == HIGH) || (state == LOW)))
  {
    Pin_Array[pin].State   = state;
    Pin_Array[pin].Changed = true;
  }
}


uint8_t DAQ_Pin_Map::get_state(Pin_ID_t pin)
{
  if ((pin >= NOT_CHIP_SELECT) &&
      (pin < NUM_PINS))
  {
    uint8_t temp_state = Pin_Array[pin].State;
    if (Pin_Array[pin].Changed == false)
    {
      return temp_state;
    }
    if (temp_state == LOW)
    {
      return HIGH;
    }
    return LOW;
  }
  return 0xFF;
}


void DAQ_Pin_Map::update_pins(void)
{
  for (int current_pin = NOT_CHIP_SELECT; current_pin < NUM_PINS; current_pin++)
  {
    if (Pin_Array[current_pin].Changed)
    {
      digitalWrite(Pin_Array[current_pin].Pin, Pin_Array[current_pin].State);
      Pin_Array[current_pin].Changed = false;
    }
  }
}


void DAQ_Pin_Map::toggle_pin(Pin_ID_t pin)
{
  if ((pin >= NOT_CHIP_SELECT) &&
      (pin < NUM_PINS))
  {
    if (Pin_Array[pin].State == LOW)
    {
      set_state(pin, HIGH);
      return;
    }
    set_state(pin, LOW);
  }
}
