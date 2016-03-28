#include <windows.h>
#include <string.h>
#include <stdio.h>

const int TAMM = 4096;

int main(int argc, char* argv[]) {
	HANDLE hFile1;
	HANDLE hFile2;
	DWORD byteRead;
	char buff[TAMM];
	if(argc == 2) {
		LPCSTR fname = argv[1];
		hFile1 = CreateFile(fname, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
		if(INVALID_HANDLE_VALUE == hFile1) {
			printf("The file %s isn´t exist, please check the name of the file.", argv[1]);
			return 0;
		}
		else {
			printf("\n");
			do {
				if(ReadFile(hFile1, buff, TAMM, &byteRead, NULL)) {
					printf("%s", buff);
				}
			} while(byteRead == TAMM);
		}
		if(CloseHandle(hFile1) == 0)
			fprintf(stderr, "\nERROR, %s file isn't closed successfully!!!!\n");
	}
	else {
		printf("Dir is %s \n", argv[1]);
		DWORD bytesWritten;
		DWORD dwPos;
		for(int i = 2; i < argc; i++) {
			int tam1=strlen(argv[1]);
			int tam2 = strlen(argv[i]);
			int t = tam1 + tam2 + 2;
			char n2[t];
			printf("%s, s = %d, tam = %d\n", argv[i], tam1 + tam2, t);
			for(int j = 0; j < tam1; j++) {
				n2[j] = argv[1][j];
			}
			n2[tam1] = '\\';
			for(int j = 0; j < tam2; j++) {
				n2[j + tam1 + 1] = argv[i][j];
			}
			n2[t - 1] = 0;
			printf("----->%s\n",n2);
			LPCSTR fname = argv[i];
			LPCSTR fname2 = n2;
			hFile1 = CreateFile(fname, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			if(hFile1 == INVALID_HANDLE_VALUE) {
				fprintf(stderr, "Problem with %s, please check the path of it \n", fname);
				continue;
			}
			hFile2 = CreateFile(fname2, GENERIC_WRITE, 0, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);
			if(hFile2 == INVALID_HANDLE_VALUE) {
				fprintf(stderr, "Problem with %s copy, please retry more later or verific that ths file doesn't exist in the directory\n", fname2);
				continue;
			}
			do {
				if(ReadFile(hFile1, buff, 4096, &byteRead, NULL)) {
					dwPos = SetFilePointer(hFile2, 0, NULL, FILE_END);
					if(LockFile(hFile2, dwPos, 0, byteRead, 0) != 0)
						printf("Locking %s...\n", fname2);
					WriteFile(hFile2, buff, byteRead, &bytesWritten, NULL);
					if(UnlockFile(hFile2, dwPos, 0, byteRead, 0) != 0)
						printf("Unlocking %s...\n", fname2);
				}
			} while (byteRead == 4096);
			if(CloseHandle(hFile2) == 0)
				fprintf(stderr,"File %s doesn't closed successfully, please check it\n", fname2);
			if(CloseHandle(hFile1) == 0)
				fprintf(stderr,"File %s doesn't closed successfully, please check it\n", fname);
		}
	}
	return 0;
}