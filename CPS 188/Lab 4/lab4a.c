#include <stdio.h>
#include <math.h>

int main (void)
{

int i, j; 
int rows = 9;


for (i = 0 ; i<=rows; i++) {
int coef = 1; 	
	for (j = 1; j <= i; j++) 
	{
    coef = coef * (i - j + 1) / j;
         printf("%4d", coef);
    }
      printf("\n");
   }
   return 0;
}
	
