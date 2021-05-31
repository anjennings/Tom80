#ifndef PIO_H_
#define PIO_H_

#include "simpletools.h"

/**
 Constant declarations
**/
#define BSTB 8
#define BRDY 9
#define ASTB 10
#define ARDY 11
#define DATAWORD 0

/**
 Function declarations
**/
void setDataIn();
void setDataOut();
void initProduceIO();
void waitARDY();
void waitBRDY();
void setBSTB();
void clearBSTB();
void setASTB();
void clearASTB();
uint8_t getPIOData();
void putPIOData(uint8_t data);
uint8_t readPIO();
void writePIO(uint8_t data);

#endif  //PIO_H