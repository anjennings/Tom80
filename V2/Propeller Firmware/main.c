#include "simpletools.h"
#include "vgatext.h"
#include "tom80.h"

int main()                                    // Main function
{
  // Add startup code here.

  //TODO: init PS/2
  
  int *cogVGA = cog_run(VGA, 512);
  int *cogDSK = cog_run(DISK, 1024);
  
  char* buffer = malloc(sizeof(char) * BUFFSIZE);
  int wHead = 0;
  int rHead = 0;
  
  //There should be an initial handshake to confirm startup
  initProduceIO();
 
  uint8_t data;
 
  while(1)
  {
    // Get command word
    data = readPIO(buffer, &wHead);
    
    switch(data) {
      case 0:
        break;
      case 1:
        break;
      default:
        break;
    }    
    
    
  }  
  
  // Should never occur, but just in case to save power
  cog_end(cogVGA);
  cog_end(cogDSK);
}
