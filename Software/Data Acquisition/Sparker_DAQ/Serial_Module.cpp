#include "Serial_Module.h"


Serial_Module::Serial_Module()
{
  Serial.begin(9600);
}


void Serial_Module::send_line(String input)
{
  Serial.println(input);
}


void Serial_Module::errorMsg(String input)
{
  if (msg_enabled)
  {
    Serial.println("Error:\t" + input);
  }
}


void Serial_Module::warningMsg(String input)
{
  if (msg_enabled)
  {
    Serial.println("Warn:\t" + input);
  }
}


void Serial_Module::debugMsg(String input)
{
  if (debug_enabled && msg_enabled)
  {
    Serial.println("Debug:\t" + input);
  }
}
