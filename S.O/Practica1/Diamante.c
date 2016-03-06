#include <stdlib.h>
#include <stdio.h>

void espacios(int n)
{
	for(int i = 0; i < n; i++)
		printf(" ");
	return;
}

void asteriscos(int n)
{
	for(int i = 0; i < n; i++)
		printf("*");
	return;
}



int main()
{
	int n;
	scanf("%d",&n);
	int k=n/2, e=n-1,nivel;
	for(nivel = 1; (nivel*2 -1) < n; nivel++ )
	{
		espacios(k);
		asteriscos(nivel);
		espacios(e);
		asteriscos((nivel*2-1));
		espacios(e);
		asteriscos(nivel);
		printf("\n");
		e-=2;
	}
	e+=2;
	asteriscos(n*3);
	printf("\n");
	for(nivel = nivel-1; nivel >=1; nivel-- )
	{
		espacios(k);
		asteriscos(nivel);
		espacios(e);
		asteriscos((nivel*2-1));
		espacios(e);
		asteriscos(nivel);
		printf("\n");
		e+=2;
	}
	return 0;
	
}






