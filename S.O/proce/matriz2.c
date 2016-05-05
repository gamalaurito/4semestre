#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "matriz.h"

void main() {
	pid_t pid;
	char *argv[1];
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
						execv("transpuesta", argv);
						exit(0);
					}
					else {
						wait(0);
						execv("inversa2", argv);
					}
				}
				else {
					wait(0);
					execv("multiplicacion", argv);
				}
			}
			else {
				wait(0);
				execv("resta", argv);
			}
		}
		else {
			wait(0);
			execv("suma", argv);
		}
	}
	else {
		wait(0);
		imprimir();
	}
	exit (0);
}