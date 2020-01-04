#include "DAQ_Pin_Map.h"

DAQ_Pin_Map::DAQ_Pin_Map() {

  /* Set up pinModes */
  for (uint8_t current_pin = NOT_CHIP_SELECT; current_pin < NUM_PINS; current_pin++) {
    pinMode(Pin_Array[current_pin].Pin, Pin_Array[current_pin].Mode);
  }

}
