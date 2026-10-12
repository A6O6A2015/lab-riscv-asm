#include <stdio.h>
#define N 4
#define M 4

int foo(int arr[][M], int n)
{
	int sum=0;
	for (int i=0;i<N;i++)
	{
		sum+=arr[i][n];
	}
	return sum;
}
int main(void)
{
	int sum;
	int arr[N][M]=
	{
		{0xc, 0xa, 0xf, 0xe},
		{0xb, 0, 0, 0xb},
		{0xd, 0xe, 0xa, 0xd},
		{0xb, 0xa, 0xb, 0xe}
	};
	sum=foo(arr, 2);
	printf("%d",sum);
}