/*
  Blank Simple Project.c
  http://learn.parallax.com/propeller-c-tutorials 
*/
#include "simpletools.h"                      // Include simple tools
#include "PS2.h"

int main()                                    // Main function
{
  // Add startup code here.

  printf("starting!\n");
  while(1)
  {
    MonitorWire();
  }  
}
