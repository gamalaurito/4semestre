#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "matriz.h"

void main() {
	printf("inversa inicia\n");
	leerMatriz1();
	leerMatriz2();
	inversa();
	imprimirInve();
	exit(0);
}