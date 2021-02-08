#include "mand.h"
	
int main(){
	//printf("hello world!\n");
	mandlebrot();
	return 0;
}

void mandlebrot(){
	
	/*
	for each pixel (Px, Py) on the screen do
    x0 := scaled x coordinate of pixel (scaled to lie in the Mandelbrot X scale (-2.5, 1))
    y0 := scaled y coordinate of pixel (scaled to lie in the Mandelbrot Y scale (-1, 1))
    x := 0.0
    y := 0.0
    iteration := 0
    max_iteration := 1000
    while (x*x + y*y ≤ 2*2 AND iteration < max_iteration) do
        xtemp := x*x - y*y + x0
        y := 2*x*y + y0
        x := xtemp
        iteration := iteration + 1
 
    color := palette[iteration]
    plot(Px, Py, color)
	*/
	
	//y_MAX - (i*y_STEP) pixel coord -> function location
	//x_MIN + (j*x_STEP) pixel coord -> function location
	
	
	
	for(int i = 0; i < HEIGHT; i++){
		//printf("y is %d, y_step is %d, y_range is %d\n", y_MAX - (i*y_STEP), y_STEP, y_RANGE);
		for(int j = 0; j < WIDTH; j++){
			//printf("\tx is %d, x_step is %d, x_range is %d\n", x_MIN + (j*x_STEP), x_STEP, x_RANGE);
			printf("%c", step(j, i));
			
		}
		printf("\n");
	}
}

char step(int px, int py){
	
	double x0 = (x_MIN + (px*x_STEP));
	double y0 = (y_MAX - (py*y_STEP));
	double x = 0;
	double y = 0;
	double iteration = 0;
	double xtemp = 0;
	
	while(((x*x) + (y*y) <= UNKNOWN_CONSTANT) & (iteration < ITERATION_MAXIMUM)){
		xtemp = (x*x) - (y*y) + x0;
		y = 2*x*y + y0;
		x = xtemp;
		iteration++;
	}
	return 	iteration > (ITERATION_MAXIMUM/50) ? '0' : ' ';/*iteration > (ITERATION_MAXIMUM/50) ? '█' :
			iteration > (ITERATION_MAXIMUM/100) ? '#' : 
			iteration > (ITERATION_MAXIMUM/150) ? '%' : 
			iteration > (ITERATION_MAXIMUM/200) ? '&' : 
			iteration > (ITERATION_MAXIMUM/250) ? '^' : 
			iteration > (ITERATION_MAXIMUM/300) ? '"' : 
			iteration > (ITERATION_MAXIMUM/350) ? '*' : '.';
			//iteration > (ITERATION_MAXIMUM/400) ? '.' : ' ';*/
}