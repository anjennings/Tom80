#include "simpletools.h"
#include "vgatext.h"
#include "PIO.h"

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
    //d = (char)readPIO();
    if((d >= 32) && (d <= 126)) {
      vgatext_putchar(vga, (0x7F & d));
      printf("I got a %c \n", (0x7F & d));
    } else if (d == '\n') {
      vgatext_putchar(vga, '\n');
    }            
  }    
}  


int main(void)                                // Main function
{
  cog_run(VGA_Proc, 1024);
  
  while(1) {
    if (vga_o == 0)
      vga_o = readPIO();
  }
}
