
#define A0 2
#define A1 3
#define A2 4
#define A3 5
#define A4 6
#define A5 7
#define A6 8
#define A7 9

#define D0 10
#define D1 11
#define D2 12
#define D3 13
#define D4 14
#define D5 15
#define D6 16
#define D7 17

#include <stdio.h>

int currentAddress = 0;
char value = 0;
bool stats = false;

void printStatus(int address, int val){

  char hex[4];

  sprintf(hex, "0x%x", val);

  Serial.print("Recieved value ");
  Serial.print(address);
  Serial.print(" : ");
  Serial.print(hex);
  Serial.print("\n\r");
  
}

void setup() {

  Serial.begin(9600);

  //Set all pins to be outputs
  for(int i = A0; i <= D7; i++){
    pinMode(i, OUTPUT);
  }

  pinMode(LED_BUILTIN, OUTPUT);
  
}

void loop() {

  stats = ~stats;
  digitalWrite(LED_BUILTIN, stats);
  
  if(currentAddress < 256){
    if(Serial.available() > 0){
      value = Serial.read();
      currentAddress++;
      printStatus(currentAddress, value);
    }

    delay(1000);
    
  }

}
