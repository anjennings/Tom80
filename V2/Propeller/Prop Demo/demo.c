#include "simpletools.h"
#include "PIO.h"


int main() {
  printf("Debug Startup!\n");
  initProduceIO();
  
  while (1) {
    printf("I got a %d \n", readPIO());
    writePIO(0xAB);
    printf("Sent Data\n");   
  }       
  
}
