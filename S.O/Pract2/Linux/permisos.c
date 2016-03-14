#include <sys/stat.h>

int main(int argc, char* argv[]) {
	int mode = atoi(argv[2]);
	int file = chmod(argv[1], mode);
	return 0;
}