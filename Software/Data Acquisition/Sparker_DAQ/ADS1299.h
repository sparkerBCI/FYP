#include "Arduino.h"

/* *INDENT-OFF* */
#define REG_TABLE /*     a             b          c          d     */                    \
        REG_ENTRY(    ID,             0x00,     true,      0xFF    )                     \
        REG_ENTRY(    CONFIG1,        0x01,     false,     0x96    )                     \
        REG_ENTRY(    CONFIG2,        0x02,     false,     0xC0    )                     \
        REG_ENTRY(    CONFIG3,        0x03,     false,     0x60    )                     \
        REG_ENTRY(    LOFF,           0x04,     false,     0x00    )                     \
        REG_ENTRY(    CH1SET,         0x05,     false,     0x61    )                     \
        REG_ENTRY(    CH2SET,         0x06,     false,     0x61    )                     \
        REG_ENTRY(    CH3SET,         0x07,     false,     0x61    )                     \
        REG_ENTRY(    CH4SET,         0x08,     false,     0x61    )                     \
        REG_ENTRY(    CH5SET,         0x09,     false,     0x61    )                     \
        REG_ENTRY(    CH6SET,         0x0A,     false,     0x61    )                     \
        REG_ENTRY(    CH7SET,         0x0B,     false,     0x61    )                     \
        REG_ENTRY(    CH8SET,         0x0C,     false,     0x61    )                     \
        REG_ENTRY(    BIAS_SENSP,     0x0D,     false,     0x00    )                     \
        REG_ENTRY(    BIAS_SENSN,     0x0E,     false,     0x00    )                     \
        REG_ENTRY(    LOFF_SENSP,     0x0F,     false,     0x00    )                     \
        REG_ENTRY(    LOFF_SENSN,     0x10,     false,     0x00    )                     \
        REG_ENTRY(    LOFF_FLIP,      0x11,     false,     0x00    )                     \
        REG_ENTRY(    LOFF_STATP,     0x12,     false,     0x00    )                     \
        REG_ENTRY(    LOFF_STATN,     0x13,     false,     0x00    )                     \
        REG_ENTRY(    GPIO,           0x14,     false,     0x0F    )                     \
        REG_ENTRY(    MISC1,          0x15,     false,     0x00    )                     \
        REG_ENTRY(    MISC2,          0x16,     false,     0x00    )                     \
        REG_ENTRY(    CONFIG4,        0x17,     false,     0x00    )                     
/* *INDENT-ON* */

typedef enum Reg_ID_t {
      #define REG_ENTRY(a, b, c, d) a,
	REG_TABLE
      #undef REG_ENTRY
	NUM_REGS
} Reg_ID_t;

class ADS1299_Module {
public:
explicit ADS1299_Module();

typedef enum Gain_Setting_t {PGA1  =  1,
	                     PGA2  =  2,
	                     PGA4  =  4,
	                     PGA6  =  6,
	                     PGA8  =  8,
	                     PGA12 = 12,
	                     PGA24 = 24} Gain_Setting_t;

typedef enum Command_t {WAKEUP  = 0x02,
	                STANDBY = 0x04,
	                RESET   = 0x06,
	                START   = 0x08,
	                STOP    = 0x0A,
	                RDATAC  = 0x10,
	                SDATAC  = 0x11,
	                RDATA   = 0x12} Command_t;


typedef struct Reg_Array_t {
	Reg_ID_t Reg_ID;
	uint8_t Address;
	bool Read_Only;
	uint8_t Value_on_Reset;
	uint8_t Current_Value;
} Reg_Areay_t;

/* Create the register array and populate the value with default value */
    #define REG_ENTRY(a, b, c, d) {a, b, c, d, d},
Reg_Array_t Reg_Array[NUM_REGS] = {REG_TABLE};
    #undef REG_ENTRY

void set_value(Reg_ID_t Register, uint8_t new_value);

uint8_t get_value(Reg_ID_t Register);



private:



int value = 0;

};
