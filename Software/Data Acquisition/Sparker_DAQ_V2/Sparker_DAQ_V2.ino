//Developed by Conor Russomanno (June 2013)
//This example uses the ADS1299 Arduino Library, a software bridge between the ADS1299 TI chip and 
//Arduino. See http://www.ti.com/product/ads1299 for more information about the device and the reference
//folder in the ADS1299 directory for more information about the library.

//Note: this Library and example file are still in early stages of development.
/*Currently, you are able to:
  - execute all System Commands (Datasheet, pg. 35-36)
  - Enable/disable read data continuous mode (Datasheet, pg. 35-38)
  - Read and write registers of the ADS1299 using RREG and WREG with HEX or BINARY values to edit the appropriate bits (Datasheet, pg. 39-47)
  
  Future Methods:
  - Commands/functions to edit ADS1299 settings without having to rewrite entire register bytes (ex. "setNumChannels(4);" would automatically power-down channels 5-8 by accessing those bits behind the scenes)
  - Fix timing issue with RDATAC - right now some data is getting lost (from test below, you'll see the serial monitor consistantly prints ~1511 samples from 225ms to 10000ms, but that # should be ~2443 based on default 250samples/second setting)
  - add SD-card functionality to log data packets to an SD
  - add txt file creation/writing for data storage when operating through a computer
*/

#include "ADS1299.h"
#include <SoftwareSerial.h>

SoftwareSerial Bluetooth(8, 9); //RX, TX

ADS1299 ADS;

//Arduino Uno - Pin Assignments; Need to use ICSP for later AVR boards
// SCK = 13
// MISO [DOUT] = 12
// MOSI [DIN] = 11
// CS = 10; 
// DRDY = 9;

//  0x## -> Arduino Hexadecimal Format
//  0b## -> Arduino Binary Format

boolean deviceIDReturned = false;
boolean startedLogging = false;
char output[50] = {0};

void setup() {

  Serial.begin(115200);
  Bluetooth.begin(38400);
  
  pinMode(3, OUTPUT);
  digitalWrite(3, LOW);
  
  ADS.setup(6, 4); // (DRDY pin, CS pin);
  delay(10);  //delay to ensure connection
  
  ADS.RESET();

   /* Check the Device ID */
   if (ADS.getDeviceID() != 3) {
    Serial.println("Error: Incorrect ID");
    while (1) {}
   }
   deviceIDReturned = true;

  ADS.SDATAC();
  ADS.WREG(CONFIG1, 0x96);   // 250sps
  ADS.WREG(CONFIG2, 0xC0);  //Disable test signals
  ADS.WREG(CONFIG3, 0xE0);  //Internal reference on, bias generator off
  ADS.WREG(MISC1, 0x20); //Connect SRB1 to all negative channel pins
  ADS.WREG(CH1SET, 0x60); //Set as normal electrode input with gain of 24
  ADS.WREG(CH2SET, 0x81); //power off unused channels and short to power
  ADS.WREG(CH3SET, 0x81);
  ADS.WREG(CH4SET, 0x81);
  ADS.WREG(CH5SET, 0x81);
  ADS.WREG(CH6SET, 0x81);
  ADS.WREG(CH7SET, 0x81);
  ADS.WREG(CH8SET, 0x81);

  /* Confirm requested setup is current */
  check_register(CONFIG1, 0xD6);
  check_register(CONFIG2, 0xC0);
  check_register(CONFIG3, 0xE0);
  check_register(CH1SET, 0x60);
  check_register(CH2SET, 0x81);
  check_register(CH3SET, 0x81);
  check_register(CH4SET, 0x81);
  check_register(CH5SET, 0x81);
  check_register(CH6SET, 0x81);
  check_register(CH7SET, 0x81);
  check_register(CH8SET, 0x81);
  check_register(MISC1, 0x20);

  Serial.println("Device Configuration Complete!");

 
  ADS.RDATAC();
  
}

void loop(){
  static long samp_num = 0;
   static long data;
    data = ADS.updateData(); 
    if (data != -1 && samp_num++ % 2) {
      snprintf(output, 11, "%010ld", data);
      Serial.print(output);
      Serial.println(",");
      samp_num = 0;
    }
    flash_LED(500);
  
}



void check_register(byte reg, uint8_t expected_value)
{
  uint8_t reg_data = 0;

  reg_data = ADS.RREG(reg);
  if (reg_data != expected_value)
  {
    ADS.printRegisterName(reg);
    Serial.print(" SET INCORRECTLY! EXPECTED ");
    Serial.print(expected_value, HEX);
    Serial.print(", ACTUAL: ");
  }
  else
  {
    ADS.printRegisterName(reg);
    Serial.print(" set correctly: ");
  }
  Serial.println(reg_data, HEX);
}

void flash_LED(unsigned int half_period) {
  static unsigned long last_toggle_millis = millis();

  if((millis() - last_toggle_millis) >= half_period) {
    digitalWrite(3, !digitalRead(3));
    last_toggle_millis = millis();
  } 
}
