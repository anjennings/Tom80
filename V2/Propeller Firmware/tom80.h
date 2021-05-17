#ifndef TOM80_H_
#define TOM80_H_

#include "simpletools.h"
#include "vgatext.h"

#define DO 24
#define CK 27
#define DI 26
#define CS 25
#define BOOT_DISK "A.dat"

#define BSTB 8
#define BRDY 9
#define ASTB 10
#define ARDY 11
#define DATAWORD 0

#define BUFFSIZE 64

#define VGANull = 0xFF

void VGA();
void DISK();
void setDataIn();
void setDataOut();
void initProduceIO();
void waitARDY();
void waitBRDY();
void setBSTB();
void clearBSTB();
uint8_t getPIOData();
void putPIOData(uint8_t data);
uint8_t readPIO();
void writePIO(uint8_t data)

#endif  /* TOM80_H_ */
