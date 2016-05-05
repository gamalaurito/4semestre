#include "matrizW.h"

void main() {
	leerMatriz1();
	int i, j;
	for(i = 0; i < TAMM; i++)
		for(j = 0; j < TAMM; j++)
			printf("%lf ", M[i][j]);
	printf("\n");
	exit(0);
}