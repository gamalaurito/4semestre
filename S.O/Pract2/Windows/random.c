#include <windows.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
	if(argc == 2) {
		srand(time(NULL));
		int archivos = rand() % 20 + 1;
		char *strs[5];
		strs[0] = "You've been the one for my";
		strs[1] = "Goodbye my lover, goodbye my friend";
		strs[2] = "Don't let me down. Please don't let me down";
		strs[3] = "We can work it out";
		strs[4] = "LALALALALALALALALALALALALALALALALALALALALALA";
		char name[100];
		int tam1 = strlen(argv[1]);
		for(int i = 0; i < tam1; i++) {
			name[i] = argv[1][i];
		}
		name[tam1++] = '\\';
		for(int i = 0, w = 0; i < archivos; i++, w++) {
			w%=5;
			for(int j = 0; j < 12; j++) {
				name[tam1 + j] = rand() % 26 + 'a';
			}
			name[tam1 + 12] = '.';
			name[tam1 + 13] = 't';
			name[tam1 + 14] = 'x';
			name[tam1 + 15] = 't';
			name[tam1 + 16] = 0;
			
			LPCSTR fname = name;
			int arr = rand() % 4 + 1;
			HANDLE hFile = CreateFile(fname, GENERIC_WRITE, 0, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);
			if(hFile == INVALID_HANDLE_VALUE) {
				fprintf(stderr, "Problem with %s, please check the path of it \n", fname);
				continue;
			}
			DWORD byteWrite, dwPos, byteRead;
 			for(int word = 0; word < arr; word++, w++, w%=5) { 
 				dwPos = SetFilePointer(hFile, 0, NULL, FILE_END);
 				byteRead = strlen(strs[w]);
 				WriteFile(hFile, strs[w], byteRead, &byteWrite, NULL); 
 				if(UnlockFile(hFile, dwPos, 0, byteRead, 0) != 0)
					printf("Unlocking %s...\n", fname);
 			}
 			if(CloseHandle(hFile) == 0)
				fprintf(stderr,"File %s doesn't closed successfully, please check it\n", fname);
		}
	}
	else {
		fprintf(stderr, "No es el uso correcto del programa \n");
	}
	return 0;
}