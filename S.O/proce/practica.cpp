#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define TAMM  10

pid_t pid;
int i, esta;

void sonL(int n) {
	i = 1;
	for(i; i <= n; i++) {
		pid = fork();
		if(pid != 0) {
			printf("Horizontal PID = %i PPID = %i i = %i\n", getpid(), getppid(), i);
			break;
		}
	}
}

void sonH(int n) {
	i = 1;
	for(i; i <= n; i++) {
		pid = fork();
		if(pid == 0) {
			printf("Vertical PID = %i PPID = %i i = %i\n", getpid(), getppid(), i);
			break;
		}
	}
}

int main() {
	if(i == 0) {
		printf("Padre PID = %i PPID = %i i = %i\n", getpid(), getppid(), i);
	}
	sonH(TAMM);
	int num = TAMM - i + 1;
	sonL(num);
	if(i == num)
		sonH(num);
	wait(0);
	exit(0);
}