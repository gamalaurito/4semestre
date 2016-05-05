#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "matriz.h"

void main() {
	//("inversa inicia\n");
	leerMatriz1();
	leerMatriz2();
	inversa();
	exit(0);
}