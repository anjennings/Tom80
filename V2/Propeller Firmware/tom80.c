#include "tom80.h"

volatile char VGABuffer;
volatile char DSKBuffer;
volatile char PS2Buffer;


// TODO: Spin waiting should removed to prevent deadlock


void VGA() {
 
 //Wait for a print character command on the buffer
 vgatext *vga;
 vga = vgatext_open(16);
 vgatext_setXY(1,1);
 vgatext_setColors(2);
 /* //Alternate for black and white
  * char custom[16];
  * custom[0] = (3 << 4) | (3 << 2) | 3;
  * custom[1] = 0;
  * vgatext_setColorPalette(custom);
  * vgatext_setColors(0);
  */
 dprint(vga, "%c", CLS);
 dprint(vga, "VGA INIT!\n");
 VGABuffer = 0;
 
 while(1) {
   //Get stuff
   if (VGABuffer != 0) {
     dprint(vga, "%c", VGABuffer 
   }     
 }   
  
}  

void DISK() {
  
  if(sd_mount(DO, CK, DI, CS)) {
    //TODO: Handle Error 
  }    
  
  FILE* cdsk = fopen(BOOT_DISK, "r");
  if (cdsk == NULL) {
    // TODO: Handle Error  
  }    
  
  while(1) {
     
  }    
}  

// Set data pins to input
void setDataIn() {
  DIRA |= (0xFF << DATAWORD);
}

// Set data pins to output
void setDataOut() {
  DIRA &= ~(0xFF << DATAWORD);
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
  while (INA & (1<<ARDY) == 0) {
    //Do nothing
  }  
} 

// Wait until BRDY goes HIGH
// BRDY signals that PIO can accept new data
void waitBRDY() {
  while (INA & (1<<BRDY) == 0) {
    //Do nothing
  }      
}   

void setBSTB() {
  OUTA |= (1 << BSTB);
}  

void clearBSTB() {
  OUTA &= ~(1 << BSTB);
} 
  

// Read data from PIO
uint8_t getPIOData() {
  return (uint8_t)(INA & (0xFF << DATAWORD));
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