#define SER 2
#define RCLK 3
#define SRCLK 4

#include <stdio.h>
bool clk;
char data;

//TODO : make a header file
void printStatus(int val){

  char hex[4];

  sprintf(hex, "0x%x", val);

  Serial.print("Recieved value");
  Serial.print(" : ");
  Serial.print(hex);
  Serial.print("\n\r");
  
}

void write8Bit(char d, bool LSB){

  for(int i = 0; i < 9; i++){

    if(LSB){
      digitalWrite(SER, (d>>i)&1);
    }else{
      digitalWrite(SER, (d<<i)&0x80);
    }
    
    delay(1);
    digitalWrite(RCLK, 1);
    delay(1);
    digitalWrite(SRCLK, 1);
    delay(1);
    digitalWrite(RCLK, 0);
    delay(1);
    digitalWrite(SRCLK, 0);
    
  }

  delay(1);
  
}

void setup() {
  // put your setup code here, to run once:
  pinMode(SER, OUTPUT);
  pinMode(RCLK, OUTPUT);
  pinMode(SRCLK, OUTPUT);

  clk = 0;
  data = 0x00;

  digitalWrite(LED_BUILTIN, false);
  Serial.begin(9600);
  
  //clear all bits
  write8Bit(data, false);
  
}

void loop() {
  // put your main code here, to run repeatedly:

  if(Serial.available() > 0){
      data = Serial.read();
      printStatus(data);
      write8Bit(data, false);
  }

  

}
