#include "mySort.h"

void mySort(int array[], unsigned int first, unsigned int last)
{
	int a;
	int b;
	int x = last - first;	
	
	for (a = 0; a <= x; a++)  //Goes from the first array and sorts through til the last array
	{	
		b = a;
		
		while (b > 0 && myCompare(array[first + b],array[first + b - 1]) < 0) //When the b is greater than equal 0 and comparing the array, x is greater than 0
		{		
				mySwap(&array[first + b - 1], &array[first + b]);
				b--;
		}
    }
}
