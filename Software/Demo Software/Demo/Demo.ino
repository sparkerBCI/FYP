#include <string.h>
#include <stdlib.h>
#include <Servo.h>

#define SOC             '<'
#define EOC             '>'
#define SERIAL_INVALID  -1

bool started = false;
bool ended = false;

char input_data;
char serial_buffer[512] = {0};
int read_char = 0;

enum Finger {
  RING,
  MIDDLE,
  INDEX,
  PINKY,
  THUMB,
  PIN_MAX
};

int pins[5] = {11, 9, 6, 5, 10};
int maxs[5] = {90, 180, 180, 180, 180};
int mins[5] = {0, 0, 0, 0, 0};
const char *finger_names[5] = {"thumb", "index", "middle", "ring", "pinky"};
Servo servos[5];

struct Pin_t {
  int digital_pin;
  int max_degs;
  int min_degs;
  const char * finger_name;
  Servo servo;
};

Pin_t Pin_Array[PIN_MAX];

void debug_str(const char * input) {
      Serial.print("The String is: \"");
      Serial.print(input);
      Serial.print("\"\n");
}

void setup() {
  Serial.begin(38400);
  
  for (int i = 0; i < PIN_MAX; i++) {
    Pin_Array[i].digital_pin = pins[i];
    Pin_Array[i].max_degs = maxs[i];
    Pin_Array[i].min_degs = mins[i];
    Pin_Array[i].finger_name = finger_names[i];
    Pin_Array[i].servo = servos[i];
    Pin_Array[i].servo.attach(Pin_Array[i].digital_pin);
  }
}

void loop() {
  // put your main code here, to run repeatedly:

  input_data = Serial.read();
  

  if (input_data != SERIAL_INVALID) {
    if (input_data == SOC) {
      started = true;
      ended = false;
      read_char = 0;
    }
    else if (started && input_data == EOC) {
      serial_buffer[read_char] = '\0';
      started = false;
      ended = true;
      process_command(serial_buffer, read_char);
      serial_buffer[0] = '\0';
    }
    else if (started) {
      serial_buffer[read_char] = input_data;
      read_char++;
    }
  }
}

void process_command(char* command, int num_chars) {

  char finger[num_chars] = {0};
  char value[num_chars] = {0};
  int value_percent = 0;
  
  for (int i = 0; i <= num_chars; i++) {
    if (command[i] == ' ') {
      for (int j = 0; j <= num_chars; j++) {
        finger[j] = command[j]; 
      }
      finger[i] = '\0';
      break;
    }
  }

  for (int i = 0; i <= num_chars; i++) {
    if (command[i] == ' ') {
      int j;
      for (j = i+1; j <= num_chars; j++) {
        value[j-i-1] = command[j]; 
      }
      value[j-i] = '\0';
      value_percent = atoi(value);
      break;
    }
  }

  for (int i = 0; i < PIN_MAX; i++) {
    if (!strcmp(finger, Pin_Array[i].finger_name)) {
      Pin_Array[i].servo.write((float)(100-value_percent)/100.0 * Pin_Array[i].max_degs);
      debug_str(Pin_Array[i].finger_name);
      Serial.println("changed to");
      Serial.println(value_percent);
    }
  }
}
