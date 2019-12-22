#include "Arduino.h"

class ADS1299_Module {  
   public:  
    explicit ADS1299_Module(int TX, int RX, int num_channels);
    
    typedef enum Gain_Setting_t {PGA1  =  1,
                                 PGA2  =  2, 
                                 PGA4  =  4, 
                                 PGA6  =  6, 
                                 PGA8  =  8, 
                                 PGA12 = 12, 
                                 PGA24 = 24} Gain_Setting_t;

    typedef enum Command_t      {WAKEUP  = 0x02,
                                 STANDBY = 0x04, 
                                 RESET   = 0x06, 
                                 START   = 0x08, 
                                 STOP    = 0x0A, 
                                 RDATAC  = 0x10, 
                                 SDATAC  = 0x11, 
                                 RDATA   = 0x12} Command_t;

//    typedef enum Reg_Addr_t      {ID = 0x02,
//                                  CONFIG1 = 0x04, 
//                                  CONFIG2 = 0x06, 
//                                  CONFIG3 = 0x08, 
//                                  LOFF = 0x0A, 
//                                  CH1SET = 0x10, 
//                                  CH2SET = 0x11,
//                                  CH3SET = 0x10, 
//                                  CH4SET = 0x11,
//                                  CH5SET = 0x10, 
//                                  CH6SET = 0x11,
//                                  CH7SET = 0x10, 
//                                  CH8SET = 0x11,
//                                  BIAS_SENSP = 0x04, 
//                                  BIAS_SENSN = 0x06, 
//                                  LOFF_SENSP = 0x08, 
//                                  LOFF_SENSN = 0x0A, 
//                                  LOFF_FLIP = 0x10, 
//                                  LOFF_STATP = 0x11,
//                                  LOFF_STATN = 0x10, 
//                                  GPIO = 0x11,
//                                  MISC1 = 0x10, 
//                                  MISC2 = 0x11,
//                                  CONFIG4 = 0x12} Reg_Addr_t;

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
        REG_ENTRY(    CONFIG4,        0x17,     false,     0x00    )                     \

    enum Reg_ID_t {
      #define REG_ENTRY(a, b, c, d) a,
      REG_TABLE
      #undef REG_ENTRY
      NUM_REGS
    };

    int Address_List[NUM_REGS] = {
      #define REG_ENTRY(a, b, c, d) b,
      REG_TABLE
      #undef REG_ENTRY
    };

    typedef struct Reg_Array_t {
      Reg_ID_t Reg_ID;
      uint8_t Address;
      bool Read_Only;
      uint8_t Value_on_Reset;
    } Reg_Areay_t;

    #define REG_ENTRY(a, b, c, d) {a, b, c, d},
    Reg_Array_t Reg_Array[NUM_REGS] = {REG_TABLE};
    #undef REG_ENTRY

    void set_value(int new_value);

    int get_value();


    
  private:

  

  int value = 0;
   
};  
