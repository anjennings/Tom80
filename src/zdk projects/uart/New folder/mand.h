#ifndef MAND_H_
#define MAND_H_

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

//#define int int16_t

#define WIDTH 150
#define HEIGHT 50
#define x_MAX (double)1
#define x_MIN (double)-2.5
#define y_MAX (double)1
#define y_MIN (double)-1

#define x_RANGE (double)(x_MAX-x_MIN)
#define y_RANGE (double)(y_MAX-y_MIN)

#define x_STEP (double)(x_RANGE/WIDTH)
#define y_STEP (double)(y_RANGE/HEIGHT)

#define ITERATION_MAXIMUM 1000
#define UNKNOWN_CONSTANT 4

#define CHAR_ON '*'
#define CHAR_OFF ' '

int main();
void mandlebrot();
char step(int px, int py);

#endif	// MAND_H_