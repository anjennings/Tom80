#include "simpletools.h"
#include "vgatext.h"
#include "PIO.h"

vgatext *vga;                                 // VGA identifier

int main(void)                                // Main function
{
  vga = vgatext_open(16);                      // Open VGA port with P0 base
    
  dprint(vga,"Hello VGA.\n");                 // Message + newline
  dprint(vga,"Hello again!\n");               // Another message
  vgatext_setColors(5);                       // Set color palette
  
  char d = 0;
  while(1) {
    d = (char)readPIO();
    vgatext_putchar(vga, (0x7F & d));
    printf("I got a %c \n", (0x7F & d));
  }    

}
