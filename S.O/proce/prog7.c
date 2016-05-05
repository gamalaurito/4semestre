#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main(int argc, char *argv[]) {
	pid_t pid;
	if(pid == 0) {
		pid = fork();
		if(pid == 0) {
			execv("validar", argv);
		}
		else {

			wait(0);
			pid = fork();
			if(pid == 0) {
				execv("permisos", argv);
			}
			else {
				pid = fork();
				if(pid == 0) {
					execv("inversa", argv);
				}
				else {
					wait(0);
					wait(0);
				}
			}
		}
	}
	else {
		wait(0);
		printf("Soy el proceso padre\n");
		exit(0);
	}
	exit(0);
}