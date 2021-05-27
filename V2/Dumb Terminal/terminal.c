#include "propeller.h"
#include "simpletools.h"
#include "vgatext.h"
#include "PIO.h"

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
      //printf("I got a %c \n", (0x7F & d));
    } else if (d == '\n') {
      vgatext_putchar(vga, '\n');
    }            
  }    
}  

int main(void)                                // Main function
{
  cog_run(VGA_Proc, 1024);
  uint8_t data;
  
  while(1) {
    data = readPIO();
    if ((vga_o == 0) && (data < 0x80)) {
      vga_o = data;
    }      
    if (data == 0x80) {
      printf("I got an 0x80\n");
      writePIO('m');
    }      
  }
}
