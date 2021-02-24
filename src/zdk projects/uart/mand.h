#ifndef MAND_H_
#define MAND_H_

#include "tom80.h"
#include <stdlib.h>
//#include <stdint.h>

#define WIDTH 100
#define HEIGHT 28

#define SCALE 100

#define x_MAX 1
#define x_MIN -2.5
#define y_MAX 1
#define y_MIN -1

#define ITERATION_MAXIMUM 100

#define x_SCALE_MAX (x_MAX * SCALE)
#define x_SCALE_MIN (x_MIN * SCALE)
#define y_SCALE_MAX (y_MAX * SCALE)
#define y_SCALE_MIN (y_MIN * SCALE)

#define x_RANGE (x_SCALE_MAX-x_SCALE_MIN)
#define y_RANGE (y_SCALE_MAX-y_SCALE_MIN)

#define x_STEP (x_RANGE/WIDTH)
#define y_STEP (y_RANGE/HEIGHT)

#define UNKNOWN_CONSTANT (4 * SCALE * SCALE)

#define CHAR_ON '.'
#define CHAR_OFF ' '

void mandlebrot();
char step(int px, int py);

#endif	// MAND_H_