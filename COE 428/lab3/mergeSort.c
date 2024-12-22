#include "mySort.h"

#include "mySort.h"
#include "metrics.h"
#include <stdio.h>
#include <stdlib.h>
 
void merge(int arr[], int x, int y, int z) // x is the beginning of the array, y is the middle and z is the end
{
    int a;
	int b;
	int c;
    int n1 = y - x + 1;
    int n2 = z - y;
    int subarr1[n1];
	int subarr2[n2];
  
    for (a = 0; a < n1; a++)
	{
        myCopy(&arr[x+a], &subarr1[a]);
	}
        
    for (b = 0; b < n2; b++)
	{
        myCopy(&arr[y+1+b], &subarr2[b]);
	}

    a = 0; // For first subarray
    b = 0; // For second subarray
    c = x; // For merged subarray

    while (a < n1 && b < n2) 
	{
		if (myCompare(subarr1[a], subarr2[b]) <= 0) 
		{
		   arr[c] = subarr1[a];
		   myCopy(&subarr1[a], &arr[c]);
		   a++;
		} 

		else 
		{
			myCopy(&subarr2[b], &arr[c]);
			b++;
		}
		
		c++;
	}

	while (a < n1) 
	{
       myCopy(&subarr1[a], &arr[c]);
       a++;
       c++;
	}

	while (b < n2) 
	{
       myCopy(&subarr2[b], &arr[c]);
       b++;
       c++;
	}
}

void mySort(int array[],unsigned int first, unsigned int last) 
{
	if (first < last) 
	{
		int m = first + (last - first) / 2; // m is the half of the array
		mySort(array, first, m);
		mySort(array, m + 1, last);
		merge(array, first, m, last);
    }
}
