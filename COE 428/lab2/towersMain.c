#include <stdlib.h>
#include "towers.h"
#include <stdio.h>

int main(int argc, char **argv)
{
    int n =3;
    int from = 1;
    int dest = 2;

	if(argc ==1) 
	{
	    towers(n, from, dest);
	}
    
	else if (argc == 2) 
	{
	    n = atoi(argv[1]);
		towers(n, from, dest);
    } 
    
	else if (argc == 4) 
	{
	    n = atoi(argv[1]);
	    from = atoi(argv[2]);
	    dest = atoi(argv[3]);

		if (from == dest)
		{
	      fprintf(stderr,"Starting and final tower cannot be the same tower\n");
	    } 

	    else if (from < 1 || from > 3) 
		{
			fprintf(stderr, "Starting tower number must be 1, 2 or 3, please input valid tower number\n");
			exit(1);
	    } 
		
		else if (dest < 1 || dest > 3) 
		{
			fprintf(stderr, "Final tower number must be 1, 2 or 3, please input valid tower number\n");
			exit(1);
	    } 

		else 
		{
		towers(n, from, dest);
	    }
    } 

	else if (argc > 4 || argc == 3)
	{
	    	fprintf(stderr, "Not a valid input .\n");
	    	exit(1);
    }   
exit(0);
}
