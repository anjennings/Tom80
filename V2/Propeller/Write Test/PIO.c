
#include "PIO.h"

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
  //DIRA |= (1 << ARDY);
  //DIRA |= (1 << BRDY);
  //DIRA &= ~(1 << ASTB);
  //DIRA &= ~(1 << BSTB);
  input(ARDY);
  input(BRDY);
  setASTB();
  setBSTB();
  setDataIn();
}  

// Wait until ARDY goes HIGH
// ARDY signals that PIO has new data
void waitARDY() {
  printf("Waiting for ARDY...\n");
  while (input(ARDY) == 0) {
    //Do nothing
  }  
} 

// Wait until BRDY goes HIGH
// BRDY signals that PIO can accept new data
void waitBRDY() {
  printf("Waiting for BRDY...\n");
  while (input(BRDY) == 0) {
    //Do nothing
  }
  //printf("Done waiting!\n");      
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
  data = (uint8_t)(INA & 0xFF);
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
