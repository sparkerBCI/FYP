#ifndef _DAQ_PIN_MAP_H
#define _DAQ_PIN_MAP_H

#include <Arduino.h>

/* #define all the pins */
/* *INDENT-OFF* */
#define PIN_TABLE /*     a                  b          c               d          */                                   \
        PIN_ENTRY(    NOT_CHIP_SELECT,      13,     OUTPUT,      "Chip Select"    )                                    \
        PIN_ENTRY(    START,                11,     OUTPUT,      "Start"          )                                    \
        PIN_ENTRY(    NOT_DATA_READY,       10,      INPUT,      "Data Ready"     )                                    \
        PIN_ENTRY(    NOT_POWER_DOWN,        9,     OUTPUT,      "Power Down"     )                                    \
        PIN_ENTRY(    STATUS_LED,           12,     OUTPUT,      "Status LED"     )                                                            
/* *INDENT-ON* */

typedef enum Pin_ID_t {
      #define PIN_ENTRY(a, b, c, d) a,
  PIN_TABLE
      #undef PIN_ENTRY
  NUM_PINS
} Pin_ID_t;

class DAQ_Pin_Map {
public:
explicit DAQ_Pin_Map();

typedef struct Pin_Array_t {
  Pin_ID_t Pin_ID;
  uint8_t Pin;
  uint8_t Mode;
  char const* Name;
} Pin_Array_t;

/* Create the register array and populate the value with default value */
    #define PIN_ENTRY(a, b, c, d) {a, b, c, d},
Pin_Array_t Pin_Array[NUM_PINS] = {PIN_TABLE};
    #undef PIN_ENTRY

private:
};


#endif
