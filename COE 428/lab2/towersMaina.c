#include <stdlib.h>
#include "towers.h"

int main(int argc, char **argv)
{
 int n;
 int from = 1;
 int dest = 2;

	if (argc = 0)
	{
		//n = atoi(argv[1]);
		towers(3, from, dest);
	}
	
 	if (argc = 2) 
	{
 		n = atoi(argv[1]);
		towers(n, from, dest);
 	}


 exit(0);
} 
