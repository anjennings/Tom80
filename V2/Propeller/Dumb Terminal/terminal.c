#include "propeller.h"
#include "simpletools.h"
#include "vgatext.h"
#include "PIO.h"
#include "Disk.h"

#define DEBUG 0

volatile char vga_o;

vgatext *vga;                                 // VGA identifier

void VGA_Proc() {
  
  vga = vgatext_open(16);                      // Open VGA port with P0 base
  vgatext_setColors(0);                        // Set color palette
  
  char d = 0;
  while(1) {
    while(vga_o == 0) {
      // spin wait 
    }  
    d = vga_o;
    vga_o = 0;    
    if((d >= 32) && (d <= 126)) {
      vgatext_putchar(vga, (0x7F & d));
    } else if (d == '\n') {
      vgatext_putchar(vga, '\n');
    }            
  }    
}  

int processCommand(uint8_t data) {
  
  uint8_t foo = 0;
  
  switch(data) {
        
    case 0x80 :         // Sanity check
      writePIO('m');    // Return an ascii char to confirm PIO/PROP functionality
      return 0;
      break;
          
    case 0x90 :         // Set disk track
      foo = readPIO();  // Track number follows command
      return setTrack(currentDrive, foo);
      break;
          
    case 0x91 :         // Set disk sector
      foo = readPIO();  // Sector number follows command
      return setSector(currentDrive, foo);
      break;
          
    case 0x92 :         // Select new disk
      foo = readPIO();  // Drive number follows command
      return selectDrive(foo);
      break;
          
    case 0x93 :         // Prepare to read (Load sector into buffer)
      readSector(currentDrive);
      return 0;
      break;
      
    case 0x94 :         // Read next sequential byte from loaded sector
      readSectorByte(currentDrive);
      return 0;
      break;
          
    case 0x95 :         // Load sector into buffer, same as for a read
      readSector(currentDrive);
      return 0;
      break;
      
    case 0x96 :         // Write incomming byte to next location in buffer
      foo = readPIO();
      writeSectorByte(currentDrive, foo);
      return 0;
      break;
      
    case 0x97 :         // Commit buffer back to disk
      writeSector(currentDrive);
      return 0;
      break;
          
    default :
      return -1;
      break;
    }    
  return 0;
}  

int main(void)                                // Main function
{
  cog_run(VGA_Proc, 1024);
  uint8_t data;
  initDisk();
  
  while(1) {
    
    data = readPIO();
    
    if (data < 0x80) {                  // if less than 0x80 its just an ascii char
      while (vga_o != 0) {
      }        
      vga_o = data;
    } else {                            // switch statement for commands
      if(processCommand(data)) {
        print("0x%x Bad Command \t\t", data);
      }        
    }               
  }
}
