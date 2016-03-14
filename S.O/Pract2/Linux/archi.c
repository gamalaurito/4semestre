#include <time.h>  //time
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h> //srand, rand
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>


int main(int argc, char* argv[]) {
	int file, file1;
	if(argc == 2) {
		printf("%s\n", argv[1]);
		file = open(argv[1], 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return 0;
		}
		//printf("Archivo %d %d\n", ban, file);
		size_t n1;
		ssize_t br;
		char buf[30];
		n1 = sizeof(buf);
		br = read(file, buf, n1);
		if(br == -1) {
			printf("Lectura archivo: %d\n",errno);
			return 0;
		}
		while(br != 0) {
			printf("%s",buf);
			br = read(file, buf, n1);
		}
		file = close(file);
		printf("\n");
	}
	else {
		printf("%s ", argv[1]);
		for(int i = 2; i < argc; i++) {
			printf("%s ", argv[i]);
			char dir[150] = "";
			strcat(dir, argv[1]);
			strcat(dir, argv[i]);
			file = open(argv[i], 06456);
			file1 = open(dir, O_CREAT|O_WRONLY, 06456);
			if(file == -1 || file1 == -1) {
				printf("Archivo open: %d\n",errno);
				return 0;
			}
			size_t n1;
			ssize_t br;
			char buf[100];
			n1 = sizeof(buf);
			br = read(file, buf, n1);
			if(br == -1) {
				printf("Lectura archivo: %d\n",errno);
				return 0;
			}
			while(br != 0) {
				printf("%s",buf);
				write(file1, buf, strlen(buf));
				br = read(file, buf, n1);
			}
			file = close(file);
			file1 = close(file1);
		}
		printf("\n");
	}
	return 0;
}
