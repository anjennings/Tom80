#include "propeller.h"
#include "simpletools.h"
#include "vgatext.h"
#include "PIO.h"
#include "Disk.h"

#define DEBUG 0

#undef VGA_TEXT_COLS 
#define VGA_TEXT_COLS 80


volatile char vga_o;

vgatext *vga;

/**
 *    Separate cog that handles VGA output
 **/
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

/**
 *    Given command, jump to appropriate subroutine
 **/

int processCommand(uint8_t data) {
  
  uint8_t foo = 0;
  
  switch(data) {
        
    case 0x80 :                         // Sanity check
      writePIO('m');                    // Return an ascii char to confirm PIO/PROP functionality
      return 0;
      break;
          
    case 0x90 :                         // Set disk track and read into buffer
      return setTrack(currentDrive, readPIO());
      break;
          
    case 0x91 :                         // Set disk sector
      return setSector(currentDrive, readPIO());
      break;
          
    case 0x92 :                         // Select new disk
      return selectDrive(readPIO());
      break;
          
    case 0x93 :                         // Send sector from buffer to Z80
      handleRead(currentDrive);
      return 0;
      break;
      
    case 0x94 :                         // Read next sequential byte from loaded sector
      handleRead(currentDrive);
      return 0;
      break;
          
    case 0x95 :                         // Load sector into buffer, same as for a read
      //readTrack(currentDrive);
      return 0;
      break;
      
    case 0x96 :                         // Write incomming byte to next location in buffer
      writeSectorByte(currentDrive, readPIO());
      return 0;
      break;
      
    case 0x97 :                         // Commit buffer back to disk
      writeTrack(currentDrive);
      return 0;
      break;
          
    default :
      return -1;
      break;
    }    
  return 0;
}  

int main(void)                          // Main function
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
    } else {
      processCommand(data);     
    }               
  }
}
