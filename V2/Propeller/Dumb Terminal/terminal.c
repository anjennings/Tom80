#include "propeller.h"
#include "simpletools.h"
#include "PIO.h"
#include "Disk.h"

#define DEBUG 0

/**
 *    Given command, jump to appropriate subroutine
 **/

int processCommand(uint8_t data) {
  
  switch(data) {
        
    case 0x80 :                         // Sanity check
      writePIO('m');                    // Return an ascii char to confirm PIO/PROP functionality
      return 0;
      break;
          
    case 0x90 :                         // Set disk track
      return setTrack(currentDrive, readPIO());
      break;
          
    case 0x91 :                         // Set disk sector
      return setSector(currentDrive, readPIO());
      break;
          
    case 0x92 :                         // Select new disk
      return selectDrive(readPIO());
      break;
          
    case 0x93 :                         // Prepare to read (Load sector into buffer)
      handleRead(currentDrive);
      return 0;
      break;
      
    case 0x94 :                         // Read next sequential byte from loaded sector
      readSectorByte(currentDrive);
      return 0;
      break;
          
    case 0x95 :                         // Load sector into buffer, same as for a read
      readSector(currentDrive);
      return 0;
      break;
      
    case 0x96 :                         // Write incomming byte to next location in buffer
      writeSectorByte(currentDrive, readPIO());
      return 0;
      break;
      
    case 0x97 :                         // Commit buffer back to disk
      writeSector(currentDrive);
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
  initDisk();
  
  while(1) {
    processCommand(readPIO());                    
  }
}
