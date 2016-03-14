#include <stdio.h>
#include <string.h>
#include <windows.h>

int main(int argc, char* argv[]) {
	if(argc != 2) {
		printf("Error favor de verificar los argumentos de entrada\n");
		printf("Formato de llamada './random [ruta_directorio]'\n");
		return 0;
	}
	else {
		srand(time(NULL));
		int archivos = rand() % 100 + 1;
		char *str[5];
		str[0] = "Hola, ¿como estas?";
		str[1] = "Espero mejore todo lo que te esta sucediendo.";
		str[2] = "Bueno todos, Sabiamos que no iria muy bien todo eso";
		str[3] = "Bueno ve lo bueno de eso, podrias no haber vivido nada de eso";
		str[4] = "Ademas aun puedes hacer mas cosas, tu confia";
		for(int i = 0, w = 0; i < archivos; i++, w++) {
			char p[100] = "";
			w%=5;
			strcat(p, argv[1]);
			int tam = strlen(argv[1]);
			for(int j = 0; j < 12; j++)
				p[tam + j] = rand() % 26 + 'a';
			LPSTR userPath = p;
			HANDLE hFile = NULL;

			hFile = ::CreateFile(userPath, GENERIC_WRITE ,
			FILE_SHARE_WRITE, 0, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
			NULL);
			DWORD written;
			int tamr = rand() % 4 + 1;
			for(int word = 0; word < tamr; word++, w++, w%=5);
				WriteFile(hfile, str[w], strlen(str[w]), &written, NULL);
			/*printf("%s",p);
			int tamr = rand() % 4 + 1;
			int file = open(p, O_CREAT|O_WRONLY, 0644);
			for(int word = 0; word < tamr; word++, w++, w%=5);
				write(file, str[w], strlen(str[w]));
			close(file);*/
		}
	}
	return 0;
}