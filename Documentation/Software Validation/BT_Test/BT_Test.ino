/*

AUTHOR: Hazim Bitar (techbitar)
DATE: Aug 29, 2013
LICENSE: Public domain (use at your own risk)
CONTACT: techbitar at gmail dot com (techbitar.com)

*/


#include <SoftwareSerial.h>

SoftwareSerial BTSerial(10, 11); // RX | TX

void setup() 
{
  pinMode(9, OUTPUT);  // this pin will pull the HC-05 pin 34 (key pin) HIGH to switch module to AT mode
  digitalWrite(9, HIGH); 
  Serial.begin(9600);
  
  BTSerial.begin(38400);  // HC-05 default speed in AT command more

}

void loop()
{
  Serial.println("Sending 16 Samples");
  BTSerial.println("0000000001\n0000000002\n0000000003\n0000000004\n0000000005\n0000000006\n0000000007\n0000000008\n0000000009\n0000000010\n0000000011\n0000000012\n0000000013\n0000000014\n0000000015\n0000000016\n");
  delay(1000);
}
