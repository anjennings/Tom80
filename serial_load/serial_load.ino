#define SER 6
#define OUTEN 5
#define RCLK 4
#define SRCLK 3
#define WE 2

#define ADDR_MASK_8 0x0FF
#define ADDR_MASK_10 0x3FF

#include <stdio.h>
bool clk;
char data;

//Print bytes out via SERIAL
void printStatus(int address, uint8_t val){

  char hex[4];

  sprintf(hex, "0x%x", val);

  Serial.print("Write value");
  Serial.print(" : ");
  Serial.print(address);
  Serial.print(" : ");
  Serial.print(hex);
  Serial.print("\n\r");
  
}

//Clock the shift and storage registers
//TODO : is this right? is shift one clock behind?
//that could explain the extra clock when writing 8 bits
void cycleCLK(){

    delay(1);
    digitalWrite(SRCLK, 1);
    delay(1);
    digitalWrite(RCLK, 1);
    delay(1);
    digitalWrite(SRCLK, 0);
    delay(1);
    digitalWrite(RCLK, 0);
  
}

//write 8 bits to the serial register
void write8Bit(char d, bool LSB){

  for(int i = 0; i < 8; i++){

    if(LSB){
      digitalWrite(SER, (d>>i)&1);
    }else{
      digitalWrite(SER, (d<<i)&0x80);
    }

    cycleCLK();
    
  }
  
}

//write using only an 8 bit address
void write16(uint8_t address, char data){
  
  //write
  write8Bit(data, false);//left
  write8Bit(address, true);//midle

  //initiate write
  delay(50);
  digitalWrite(WE, false);
  delay(10);
  digitalWrite(WE, true);
  delay(50);
  
}

//write a value at the given address on the EEPROM
void writeINST(int address, char data, bool LSB, int addr_mask){

  int addr_valid = address & addr_mask;
  char addr_l = (char)(addr_valid & 0xFF);
  char addr_h = (char)((addr_valid & 0xF00)>>8);
  
  //clear one set
  write8Bit(0x00, LSB);
  //write
  write8Bit(data, LSB);//left
  write8Bit(addr_l, LSB);//midle
  write8Bit(addr_h, LSB);//right
  //cycleCLK();

  //initiate write
  delay(500);
  digitalWrite(WE, false);
  delay(100);
  digitalWrite(WE, true);
  delay(500);
  
}

void setup() {

  //set up pins
  pinMode(SER, OUTPUT);
  pinMode(RCLK, OUTPUT);
  pinMode(SRCLK, OUTPUT);
  pinMode(WE,OUTPUT);

  //set write enable off
  digitalWrite(WE, true);
  digitalWrite(SER, false);
  digitalWrite(RCLK, false);
  digitalWrite(SRCLK, false);
  
  //turn off internal LED
  digitalWrite(LED_BUILTIN, false);
 
  Serial.begin(9600);
  
  delay(2000);
  
  //clear out the shift register
  write8Bit(0x00, false);
  write8Bit(0x00, false);

  Serial.write("Booting up!");

  //write 0-255 of the EEPROM
  /*for(uint8_t i = 0; i < 0xFF; i++){
    //delay(1000);
    write16(i, ~i);
    printStatus(i, ~i);
  }*/

  uint8_t i = 0;
  uint8_t data = 0;

  while(1){
    if (Serial.available() > 0) {
      data = Serial.read();

      write16(i, data);
      printStatus(i++, data);
    }
  }

  digitalWrite(WE, true);
  digitalWrite(SER, false);
  digitalWrite(RCLK, false);
  digitalWrite(SRCLK, false);

}

void loop() {

  

  //flash LED to indicate that the write is finished
  digitalWrite(LED_BUILTIN, true);
  delay(1000);
  digitalWrite(LED_BUILTIN, false);
  delay(800);
}
