/*
  Blank Simple Project.c
  http://learn.parallax.com/propeller-c-tutorials 
*/
#include "simpletools.h"                      // Include simple tools
#include "PIO.h"

int main()                                    // Main function
{
  // Add startup code here.
  initProduceIO();
 
  while(1)
  {
    // Add main loop code here.
    //writePIO(0xAA);
    //setBSTB();
    waitBRDY();
    setDataOut();
    clearBSTB();
    putPIOData(0xAA);
    pause_ticks((CLKFREQ/1000000) * 30000);
    setBSTB();
  }  
}
