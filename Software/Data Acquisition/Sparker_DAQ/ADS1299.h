#include "Arduino.h"

class ADS1299_Module {  
   public:  
    explicit ADS1299_Module(int TX, int RX, int num_channels);

    void set_value(int new_value);

    int get_value();
    
  private:

  int value = 0;
   
};  
