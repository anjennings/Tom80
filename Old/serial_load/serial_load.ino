#define SER 6
#define OUTEN 5
#define RCLK 4
#define SRCLK 3
#define WE 2
#define DELAY 10

#define ADDR_MASK_8 0x0FF
#define ADDR_MASK_10 0x3FF

char ROM[16] = {0, 0, 0, 0, 0x3E, 0x00, 0xC6, 0x01, 0x76, 0, 0, 0, 0, 0, 0};

#include <stdio.h>
bool clk;
//char data;

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
void cycleCLK(){

    delay(5);
    digitalWrite(SRCLK, 1);
    delay(5);
    digitalWrite(RCLK, 1);
    delay(5);
    digitalWrite(SRCLK, 0);
    delay(5);
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

  //printStatus(address, data);
  //write
  write8Bit(data, false);//left
  write8Bit(address, true);//midle

  //initiate write
  delay(20*DELAY);
  digitalWrite(WE, false);
  delay(1*DELAY);
  digitalWrite(WE, true);
  //delay(20);
  
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
  //write8Bit(0x00, false);
  write8Bit(0x00, false);
  write8Bit(0x00, false);

  Serial.write("Booting up!");

/*
  for(uint8_t i = 0; i < 255; i++){

    digitalWrite(LED_BUILTIN, (i%2));
    write16(i, i);
      
  }
*/  

  digitalWrite(WE, true);
  digitalWrite(SER, false);
  digitalWrite(RCLK, false);
  digitalWrite(SRCLK, false);
  digitalWrite(LED_BUILTIN, true);
/*
for(int i = 0; i < 16; i++){
    write16(i, ROM[i]);
    digitalWrite(LED_BUILTIN, (i%2));
}
*/
}

uint8_t i = 0;
uint8_t data = 0;

void loop() {

  if (Serial.available() > 0) {
      
    data = Serial.read();

    write16(i, data);
    digitalWrite(LED_BUILTIN, (i%2));
    i++;
    Serial.write(data);
      
  }

}
