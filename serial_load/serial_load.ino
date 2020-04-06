#define SER 2
#define RCLK 3
#define SRCLK 4
#define WE 12
#define ADDR_MASK_8 0x0FF
#define ADDR_MASK_10 0x3FF

#include <stdio.h>
bool clk;
char data;

//TODO : make a header file
void printStatus(int address, int val){

  char hex[4];

  sprintf(hex, "0x%x", val);

  Serial.print("Write value");
  Serial.print(" : ");
  Serial.print(address);
  Serial.print(" : ");
  Serial.print(hex);
  Serial.print("\n\r");
  
}

void cycleCLK(){

    delay(1);
    digitalWrite(RCLK, 1);
    delay(1);
    digitalWrite(SRCLK, 1);
    delay(1);
    digitalWrite(RCLK, 0);
    delay(1);
    digitalWrite(SRCLK, 0);
  
}

void write8Bit(char d, bool LSB){

  for(int i = 0; i < 8; i++){

    if(LSB){
      digitalWrite(SER, (d>>i)&1);
    }else{
      digitalWrite(SER, (d<<i)&0x80);
    }

    cycleCLK();
    
  }

  delay(1);
  
}

void writeINST(int address, char data, bool LSB, int addr_mask){

  int addr_valid = address & addr_mask;
  char addr_l = (char)(addr_valid & 0xFF);
  char addr_h = (char)((addr_valid & 0xF00)>>8);
  
  //clear all bits
  write8Bit(0x00, LSB);
  write8Bit(0x00, LSB);
  write8Bit(0x00, LSB);
  //write
  write8Bit(data, LSB);//left
  write8Bit(addr_l, true);//midle
  write8Bit(addr_h, LSB);//right
  cycleCLK();

  digitalWrite(WE, false);
  delayMicroseconds(150);
  digitalWrite(WE, true);
  
}

void setup() {
  // put your setup code here, to run once:
  pinMode(SER, OUTPUT);
  pinMode(RCLK, OUTPUT);
  pinMode(SRCLK, OUTPUT);
  pinMode(WE,OUTPUT);

  
  digitalWrite(WE, true);
  digitalWrite(LED_BUILTIN, false);
  Serial.begin(9600);

  for(int i = 0; i <= 0xFF; i++){

    writeINST(i, 0x00, false, ADDR_MASK_8);
    printStatus(i, 0x00);
    
  }
  digitalWrite(LED_BUILTIN, true);
}

void loop() {
  // put your main code here, to run repeatedly:
  

}
