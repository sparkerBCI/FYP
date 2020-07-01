#include "ADS1299.h"
#include <SoftwareSerial.h>

SoftwareSerial Bluetooth(8, 9);

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

void setup() {

  Serial.begin(115200);
  Bluetooth.begin(38400);

  randomSeed(analogRead(0));
  
  pinMode(3, OUTPUT);
  digitalWrite(3, LOW);
  
  ADS.setup(6, 4); // (DRDY pin, CS pin);
  delay(10);  //delay to ensure connection
  
  ADS.RESET();

   /* Check the Device ID */
   if (ADS.getDeviceID() != 3) {
    Serial.println("Error: Incorrect ID");
    Bluetooth.println("Error: Incorrect ID");
    while (1) {}
   }
   deviceIDReturned = true;

  ADS.SDATAC();
  ADS.STOP();
  ADS.WREG(CONFIG1, 0x96);   // 250sps
  ADS.WREG(CONFIG2, 0xC0);  //Disable test signals
  ADS.WREG(CONFIG3, 0xE0);  //Internal reference on, bias generator off
  ADS.WREG(MISC1, 0x20); //Connect SRB1 to all negative channel pins
  ADS.WREG(CH1SET, 0x60); //Set as normal electrode input with gain of 24
  ADS.WREG(CH2SET, 0x60); 
  ADS.WREG(CH3SET, 0x60);
  ADS.WREG(CH4SET, 0x60);
  ADS.WREG(CH5SET, 0x60);
  ADS.WREG(CH6SET, 0x60);
  ADS.WREG(CH7SET, 0x60);
  ADS.WREG(CH8SET, 0x60);

  /* Confirm requested setup is current */
//  check_register(CONFIG1, 0xD6);
//  check_register(CONFIG2, 0xC0);
//  check_register(CONFIG3, 0xE0);
//  check_register(CH1SET, 0x60);
//  check_register(CH2SET, 0x60);
//  check_register(CH3SET, 0x60);
//  check_register(CH4SET, 0x60);
//  check_register(CH5SET, 0x60);
//  check_register(CH6SET, 0x60);
//  check_register(CH7SET, 0x60);
//  check_register(CH8SET, 0x60);
//  check_register(MISC1, 0x20);

  Serial.println("Device Configuration Complete! Press any key to continue...");
  Bluetooth.println("Device Configuration Complete! Waiting for operator...");
  while (Bluetooth.available() < 1)
  {
  }
  Bluetooth.read();
  Serial.println("Starting data generation...");
  Bluetooth.println("Starting data generation...");
  delay(500);
  Serial.println("Let Hand Rest");
  Bluetooth.println("Let Hand Rest");
  delay(1000);
  
}

void loop(){
   static unsigned long start_time;
   static int data_label = 0;
   
   data_label = data_label % 2;

   prompt_cue(data_label);
   Bluetooth.println("Start!\n\n");
   Serial.println("Start!\n\n");
   ADS.START();
   ADS.RDATAC();

   start_time = millis();

  while(millis() < start_time + 2000) {
    long res = ADS.updateData(data_label); 
    if (res != -1) {
      Bluetooth.print(data_label);
      Bluetooth.print('\t');
      Bluetooth.println(res, HEX);
    }
    flash_LED(500);
  }

  ADS.SDATAC();
  ADS.STOP();
  Bluetooth.println("\n\nStop! Let Hand Rest...\n\n");
  Serial.println("\n\nStop! Let Hand Rest...\n\n");
  delay(500);
  data_label++;
  
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

/*! ******************************************************************************************
 *  @brief Prompts the user to prepare for the appropriate movement and gives 3 second timer.
 *
 *  @param[in] data_label              - The type of movement to execute. 1 for open, 0 for closed
 *
 *********************************************************************************************/
void prompt_cue(int data_label)
{
  if (data_label)
  {
    Bluetooth.println("Prepare to Open Hand...");
    Serial.println("Prepare to Open Hand...");
  }
  else
  {
    Bluetooth.println("Prepare to Close Hand...");
    Serial.println("Prepare to Close Hand...");
  }
  delay(1000);
  Bluetooth.println("3..");
  Serial.println("3..");
  delay(500);
  Bluetooth.println("2...");
  Serial.println("2...");
  delay(500);
  Bluetooth.println("1...");
  Serial.println("1...");
  delay(500);
}
