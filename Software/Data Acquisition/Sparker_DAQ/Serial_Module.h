#ifndef SERIAL_MODULE_H
#define SERIAL_MODULE_H

#include <Arduino.h>

class Serial_Module {
public:
  explicit Serial_Module();

  void send_line(String input);
  void errorMsg(String input);
  void warningMsg(String input);
  void debugMsg(String input);

  bool debug_enabled = false;
  bool msg_enabled   = false;

private:
};

#endif
