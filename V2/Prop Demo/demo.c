#include "simpletools.h"

/**
 Constant declarations
**/
#define BSTB 8
#define BRDY 9
#define ASTB 10
#define ARDY 11
#define DATAWORD 0

/**
 Function declarations
**/
void setDataIn();
void setDataOut();
void initProduceIO();
void waitARDY();
void waitBRDY();
void setBSTB();
void clearBSTB();
void setASTB();
void clearASTB();
uint8_t getPIOData();
void putPIOData(uint8_t data);
uint8_t readPIO();
void writePIO(uint8_t data);


/**
  Function definitions
**/

// Set data pins to input
void setDataIn() {
  DIRA &= ~(0xFF << DATAWORD);
}

// Set data pins to output
void setDataOut() {
  DIRA |= (0xFF << DATAWORD);
}  

// Init data and handshake lines
void initProduceIO() {
 
  // These should only need to be set once
  DIRA |= (1 << ARDY);
  DIRA |= (1 << BRDY);
  DIRA &= ~(1 << ASTB);
  DIRA &= ~(1 << BSTB);
 
  setDataIn();
  
}  

// Wait until ARDY goes HIGH
// ARDY signals that PIO has new data
void waitARDY() {
  while (input(ARDY) == 0) {
    printf("Waiting for ARDY...\n");
  }  
} 

// Wait until BRDY goes HIGH
// BRDY signals that PIO can accept new data
void waitBRDY() {
  while (input(BRDY) == 0) {
    printf("Waiting for BRDY...\n");
  }      
}   

void setASTB() {
  high(ASTB);
}  

void clearASTB() {
  low(ASTB);
} 

void setBSTB() {
  high(BSTB);
}  

void clearBSTB() {
  low(BSTB);
} 
  

// Read data from PIO
uint8_t getPIOData() {
  uint8_t data;
  clearASTB();
  data = (uint8_t)(INA & (0xFF << DATAWORD));
  setASTB();
  return data;
}  

void putPIOData(uint8_t data) {
  OUTA &= ~(0xFF << DATAWORD);  // Clear Databus
  OUTA |= (data << DATAWORD);   // Put new word on bus
}  

// Grab data from PIO and return
uint8_t readPIO() {
  setDataIn();
  waitARDY();
  return getPIOData();  
}  

void writePIO(uint8_t data) {
  waitBRDY();
  setDataOut();
  putPIOData(data);
  clearBSTB();
  setBSTB();
}  

int main() {
  printf("Debug Startup!\n");
  initProduceIO();
  
  printf("I got a %d \n", readPIO());
  writePIO(0xAB);
  printf("Sent Data\n");        
 
}
