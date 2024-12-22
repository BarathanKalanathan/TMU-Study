#include <stdio.h>
#include <stdlib.h>
#include "mySort.h"

int main(int argc, char * argv[])
{
	int data[100000]; /* Array of ints to sort */
	int nDataItems; /* number of actual items in the array */ 
	int i;

	if (argc == 1)
	{
		/* Test data */
		nDataItems = 5;
		data[0] = 82;
		data[1] = 38;
		data[2] = 184;
		data[3] = 40;
		data[4] = 19491;
		mySort(data, nDataItems);

		for (i=0; i < nDataItems; i++) 
		{
			printf("%d\n", data[i]);
		}
	}

	else if (argc>1)
	{
		nDataItems = argc-1;

		for (i = 1; i < argc; i++) 
		{
			data[i-1] = atoi(argv[i]);
		}

		mySort(data, nDataItems);

		for (i=0; i < nDataItems; i++) 
		{	
			printf("%d\n", data[i]);
		}
		
	}

 /* Check that the data array is sorted. */
 for(i = 0; i < nDataItems-1; i++) {
 if (data[i] > data[i+1]) {
 fprintf(stderr, "Sort error: data[%d] (= %d)"
 " should be <= data[%d] (= %d)- -aborting\n",
 i, data[i], i+1, data[i+1]);
 exit(1);
 }
 }

exit(0);
} 
