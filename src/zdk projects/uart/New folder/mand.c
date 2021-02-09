#include "mand.h"
	
int main(){
	mandlebrot();
	return 0;
}

void mandlebrot(){
	for(int i = 0; i < HEIGHT; i++){
		for(int j = 0; j < WIDTH; j++){
			printf("%c", step(j, i));
		}
		printf("\n");
	}
}

char step(int px, int py){
	
	int x0 = (x_SCALE_MIN + (px*x_STEP));
	int y0 = (y_SCALE_MAX - (py*y_STEP));
	int x = 0;
	int y = 0;
	int iteration = 0;
	int xtemp = 0;
	
	while((((x*x)) + ((y*y)) <= UNKNOWN_CONSTANT) & (iteration < ITERATION_MAXIMUM)){
		xtemp = ((x*x)/(SCALE)) - ((y*y)/(SCALE)) + (x0);
		y = ((2*x*y)/(SCALE)) + y0;
		x = xtemp;
		iteration++;
	}
	return 	iteration == (ITERATION_MAXIMUM) ? CHAR_ON : CHAR_OFF;
}