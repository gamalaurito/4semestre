#include <stdlib.h>
#include <stdio.h>

long int memo[2000];

long int fibo(long int n)
{
	if(n==0) return 1;
	if(n==1) return 1;
	if(!memo[n]) return memo[n];
	memo[n] = fibo(n-2) + fibo(n-1);
	return memo[n];
}


int main()
{
	long int n;
	scanf("%ld",&n);
	printf("%ld\n",fibo(n-1));
	return 0;
}