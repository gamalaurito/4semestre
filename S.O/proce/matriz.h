//libreias
	#include <math.h>
	#include <errno.h>
	#include <fcntl.h>
	#include <string.h>
	#include <sys/stat.h>
	#include <sys/types.h>

//constantes
	#define TAMM 5
	const double ERROR = 1e-9;
	const char sal[] = " ";
	const char sumaC[] = "Suma:\n";
	const char restaC[] = "Resta:\n"; 
	const char multiplicacionC[] = "Multiplicacion:\n"; 
	const char inversaC[] = "Inversa:\n";
	const char trapuesta1C[] = "Transpuesta 1:\n";
	const char trapuesta2C[] = "Transpuesta 2:\n";

//definicion de Matriz
	double M1[TAMM][TAMM];
	double M2[TAMM][TAMM];
	double M3[TAMM][TAMM];

//operaciones
	int Igual(double a, double b) {
	    return fabs(a - b) < ERROR;
	}

	void resta() {
		int i, j;
		for(i = 0; i < TAMM; i++)
			for(j = 0; j < TAMM; j++)
				M1[i][j] -= M2[i][j];
		int file = open("resta.txt", O_CREAT|O_WRONLY, 0644);
		//write(file, restaC, strlen(restaC));
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				//parseIntToString(M1[i][j]);
				write(file, &M1[i][j], sizeof(double));
				write(file, sal, strlen(sal));
			}
		}
		close(file);
	}

	void multiplicacion() {
		int i, j, k;
		int file = open("multiplicacion.txt", O_CREAT|O_WRONLY, 0644);
		//write(file, multiplicacionC, strlen(multiplicacionC));
		for(i = 0; i < TAMM; i++)
			for(j = 0; j < TAMM; j++)
				for(k = 0; k < TAMM; k++)
					M3[i][j] += M1[j][k] * M2[i][k];
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				//parseIntToString(M3[i][j]);
				//write(file, cad, strlen(cad));
				write(file, &M3[i][j], sizeof(double));
				write(file, sal, strlen(sal));
			}
		}
		close(file);
	}

	void transpuesta() {
		int i, j;
		int file = open("transpuesta.txt", O_CREAT|O_WRONLY, 0644);
		//write(file, trapuesta1C, strlen(trapuesta1C));
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				//parseIntToString(M1[j][i]);
				write(file, &M1[i][j], sizeof(double));
				write(file, sal, strlen(sal));
				//write(file, cad, strlen(cad));
			}
		}
		//write(file, trapuesta2C, strlen(trapuesta2C));
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				//parseIntToString(M2[j][i]);
				//write(file, cad, strlen(cad));
				write(file, &M2[i][j], sizeof(double));
				write(file, sal, strlen(sal));
			}
		}
		close(file);
	}
	// Realiza eliminacion Gaussiana en una matriz e inversa
	void swap1(int f1, int f2) {
		int i;
		double af[TAMM], afi[TAMM];
		for(i = 0; i < TAMM; i++) {
			af[i] = M1[f1][i];
			afi[i] = M3[f1][i];
			M3[f1][i] = M3[f2][i];
			M1[f1][i] = M1[f2][i]; 
		}
		for(i = 0; i < TAMM; i++) {
			M1[f2][i] = af[i];
			M3[f2][i] = afi[i]; 
		}
	}

	void swap2(int f1, int f2) {
		int i;
		double af[TAMM], afi[TAMM];
		for(i = 0; i < TAMM; i++) {
			af[i] = M2[f1][i];
			afi[i] = M3[f1][i];
			M3[f1][i] = M3[f2][i];
			M2[f1][i] = M2[f2][i]; 
		}
		for(i = 0; i < TAMM; i++) {
			M2[f2][i] = af[i];
			M3[f2][i] = afi[i]; 
		}
	}

	void EliminaGaussiana1() {
		int i, j, k;
	    for (i = 0; i < TAMM; ++i) {
	        int fila_mayor = i;
	        for (j = i + 1; j < TAMM; ++j)
	            if (fabs(M1[fila_mayor][i]) < fabs(M1[j][i])) 
	            	fila_mayor = j;
	        swap1(i, fila_mayor);
	        if (Igual(M1[i][i], 0))
	        	continue;
	        for (j = TAMM - 1; j >= i; --j) {
	            M1[i][j] /= M1[i][i];
	            M3[i][j] /= M1[i][i];

	        }
	        for (j = 0; j < TAMM; ++j) {
	            if (i == j || Igual(M1[j][i], 0)) continue;
	            double ratio = M1[j][i] / M1[i][i];
	            for (k = i; k < TAMM; ++k) {
	                M1[j][k] -= M1[i][k] * ratio;
	                M3[j][k] -= M3[i][k] * ratio;
	            }
	        }
	    }
	}

	void EliminaGaussiana2() {
		int i, j, k;
	    for (i = 0; i < TAMM; ++i) {
	        int fila_mayor = i;
	        for (j = i + 1; j < TAMM; ++j)
	            if (fabs(M2[fila_mayor][i]) < fabs(M2[j][i])) 
	            	fila_mayor = j;
	        swap2(i, fila_mayor);
	        if (Igual(M2[i][i], 0))
	        	continue;
	        for (j = TAMM - 1; j >= i; --j) {
	            M2[i][j] /= M2[i][i];
	            M3[i][j] /= M2[i][i];

	        }
	        for (j = 0; j < TAMM; ++j) {
	            if (i == j || Igual(M2[j][i], 0)) continue;
	            double ratio = M2[j][i] / M2[i][i];
	            for (k = i; k < TAMM; ++k) {
	                M2[j][k] -= M2[i][k] * ratio;
	                M3[j][k] -= M3[i][k] * ratio;
	            }
	        }
	    }
	}

	void identidad() {
		int i, j;
		for(i = 0; i < TAMM; i++)
			for(j = 0 ; j < TAMM; j++)
				M3[i][j] = (i == j)?1:0;
	}

	void inversa() {
		int i, j;
		identidad();
		EliminaGaussiana1();
		int file = open("inversa.txt", O_CREAT|O_WRONLY, 0644);
		if(file == -1) {
			printf("Archivo error: %d\n",errno);
			printf("Error\n");
			return;
		}
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				write(file, &M3[i][j], sizeof(double));
				write(file, sal, strlen(sal));
			}
		}
		identidad();
		EliminaGaussiana2();
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				write(file, &M3[i][j], sizeof(double));
				write(file, sal, strlen(sal));
			}
		}
		close(file);
		return;
	}

	void suma() {
		int i, j;
		for(i = 0; i < TAMM; i++)
			for(j = 0; j < TAMM; j++)
				M1[i][j] += M2[i][j];
		int file = open("suma.txt", O_CREAT|O_WRONLY, 0644);
		//write(file, sumaC, strlen(sumaC));
		for(i = 0; i < TAMM; i++) {
			for(j = 0; j < TAMM; j++) {
				//parseIntToString(M1[i][j]);
				//write(file, cad, strlen(cad));
				write(file, &M1[i][j], sizeof(double));
				write(file, sal, strlen(sal));
			}
		}
		close(file);
	}

//Imprimir Matrices
	void imprimirMul() {
		int file = open("multiplicacion.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		double m;
		int br = read(file, &m, sizeof(double));
		char c;
		br = read(file, &c, sizeof(char));
		int i = 0;
		printf("Multiplicacion:\n");
		while(br != 0) {
			if(i == TAMM) {
				printf("\n");
				i = 0;
			}
			printf("%lf%c", m, c);
			br = read(file, &m, sizeof(double));
			br = read(file, &c, sizeof(char));
			i++;
		}
		file = close(file);
		printf("\n");
	}

	void imprimirSum() {
		int file = open("suma.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		double m;
		int br = read(file, &m, sizeof(double));
		int i = 0;
		char c;
		br = read(file, &c, sizeof(char));
		printf("Suma:\n");
		while(br != 0) {
			if(i == TAMM) {
				printf("\n");
				i = 0;
			}
			printf("%lf%c", m, c);
			br = read(file, &m, sizeof(double));
			br = read(file, &c, sizeof(char));
			i++;
		}
		file = close(file);
		printf("\n");
	}

	void imprimirRes() {
		int file = open("resta.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		double m;
		int br = read(file, &m, sizeof(double));
		int i = 0;
		char c;
		br = read(file, &c, sizeof(char));
		printf("Resta:\n");
		while(br != 0) {
			if(i == TAMM) {
				printf("\n");
				i = 0;
			}
			printf("%lf%c", m, c);
			br = read(file, &m, sizeof(double));
			br = read(file, &c, sizeof(char));
			i++;
		}
		file = close(file);
		printf("\n");
	}

	void imprimirTra() {
		int file = open("transpuesta.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		double m;
		int br = read(file, &m, sizeof(double));
		int i = 0;
		int j = 0;
		char c;
		br = read(file, &c, sizeof(char));
		printf("Traspuesta 1:\n");
		while(br != 0) {
			if(i == TAMM) {
				printf("\n");
				i = 0;
				j++;
				if(j == TAMM) {
					printf("Traspuesta 2:\n");
					j = 0;
				}
			}
			printf("%lf%c", m, c);
			br = read(file, &m, sizeof(double));
			br = read(file, &c, sizeof(char));
			i++;
		}
		file = close(file);
		printf("\n");
	}

	void imprimirInve() {
		int file = open("inversa.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		double m;
		int br = read(file, &m, sizeof(double));
		int i = 0;
		int j = 0;
		char c;
		br = read(file, &c, sizeof(char));
		printf("Inversa 1:\n");
		while(br != 0) {
			if(i == TAMM) {
				printf("\n");
				i = 0;
				j++;
				if(j == TAMM) {
					printf("Inversa 2:\n");
					j = 0;
				}
			}
			printf("%lf%c", m, c);
			br = read(file, &m, sizeof(double));
			br = read(file, &c, sizeof(char));
			i++;
		}
		file = close(file);
		printf("\n");
	}

	void imprimir() {
		imprimirMul();
		imprimirSum();
		imprimirRes();
		imprimirTra();
		imprimirInve();
	}

//Lectura 
	void leerMatriz1() {
		int file = open("m1.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		size_t n1;
		ssize_t br;
		char buf[4098];
		n1 = sizeof(buf);
		br = read(file, buf, n1);
		int num = 0;
		while(br != 0) {
			br = strlen(buf);
			int i, j;
			for(i = 0, j = 0; i < br; i++) {
				if(buf[i] == ' ') {
					M1[j/TAMM][j%TAMM] = num;
					j++;
					num = 0;
				}
				else if(buf[i] == '\n') {
					num = 0;
				}
				else {
					num = num * 10 + (buf[i] - '0');
				}
			}
			br = read(file, buf, n1);
		}
		close(file);
	}

	void leerMatriz2() {
		int file = open("m2.txt", 06456);
		if(file == -1) {
			printf("Archivo open: %d\n",errno);
			return;
		}
		size_t n1;
		ssize_t br;
		char buf[4098];
		n1 = sizeof(buf);
		br = read(file, buf, n1);
		int num = 0;
		while(br != 0) {
			br = strlen(buf);
			int i, j;
			for(i = 0, j = 0; i < br; i++) {
				if(buf[i] == ' ') {
					M2[j/TAMM][j%TAMM] = num;
					j++;
					num = 0;
				}
				else if(buf[i] == '\n') {
					num = 0;
				}
				else {
					num = num * 10 + (buf[i] - '0');
				}
			}
			br = read(file, buf, n1);
		}
		close(file);
	}	