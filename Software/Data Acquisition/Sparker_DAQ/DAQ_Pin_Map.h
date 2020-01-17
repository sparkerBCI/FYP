#ifndef DAQ_PIN_MAP_H
#define DAQ_PIN_MAP_H

#include <Arduino.h>
#include <SPI.h>

/* #define all the pins */

/* *INDENT-OFF* */
#define PIN_TABLE                                                                                          \
   /*               a                b             c                  d                e*/                 \
   PIN_ENTRY(NOT_CHIP_SELECT,       13,         OUTPUT,         "Chip Select",       HIGH)                 \
   PIN_ENTRY(START_PIN,             11,         OUTPUT,               "Start",        LOW)                 \
   PIN_ENTRY(NOT_DATA_READY,        10,   INPUT_PULLUP,          "Data Ready",       HIGH)                 \
   PIN_ENTRY(NOT_POWER_DOWN,         9,         OUTPUT,          "Power Down",       HIGH)                 \
   PIN_ENTRY(STATUS_LED,            12,         OUTPUT,          "Status LED",        LOW)
/* *INDENT-ON* */

typedef enum Pin_ID_t
{
#define PIN_ENTRY(a, b, c, d, e)    a,
  PIN_TABLE
#undef PIN_ENTRY
  NUM_PINS
} Pin_ID_t;

class DAQ_Pin_Map {
public:
  explicit DAQ_Pin_Map();

  void set_state(Pin_ID_t pin, uint8_t state);

  uint8_t get_state(Pin_ID_t pin);

  void update_pins(void);

  void toggle_pin(Pin_ID_t pin);

  typedef struct Pin_Array_t
  {
    Pin_ID_t   Pin_ID;
    uint8_t    Pin;
    uint8_t    Mode;
    char const *Name;
    uint8_t    State;
    bool       Changed;
  } Pin_Array_t;

/* Create the register array and populate the value with default value */
#define PIN_ENTRY(a, b, c, d, e)    { a, b, c, d, e, false },
  Pin_Array_t Pin_Array[NUM_PINS] = { PIN_TABLE };
#undef PIN_ENTRY

  const long long SPI_SPEED_HZ = 4000000;
  const int SPI_ENDIAN         = MSBFIRST;
  const int SPI_MODE           = SPI_MODE1;
};


#endif
