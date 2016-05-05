#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "matriz.h"

void main() {
	pid_t pid;

	int i, j;
	
	leerMatriz1();
	leerMatriz2();

	pid = fork();
	if(pid == 0) {
		pid = fork();
		if(pid == 0) {
			pid = fork();
			if(pid == 0) {
				pid = fork();
				if(pid == 0) {
					pid = fork();
					if(pid == 0) {
						transpuesta();
						exit(0);
					}
					else {
						inversa();
						wait(0);
						exit(0);
					}
				}
				else {
					multiplicacion();
					wait(0);
					exit(0);
				}
			}
			else {
				resta();
				wait(0);
				exit(0);
			}
		}
		else {
			suma();
			wait(0);
			exit(0);
		}
	}
	else {
		wait(0);
		imprimir();
	}
	exit (0);
}