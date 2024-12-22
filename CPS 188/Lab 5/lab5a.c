#include <stdio.h>
#include <math.h>

void

order(double * Large, double * Small)
 
{

double x;
    
    if (*Small < *Large) 
    {
			x = *Small;
        
			*Small = *Large;
        
			*Large = x;
    }
}

int
	main (void)

	{
		double N1;
		double N2;
		double N3;

			printf("Please enter the three number that you would like to sort in ascending order.   Please seperate each number with a space:");
			scanf(" %lf %lf %lf", & N1, & N2, & N3);
    
				order(& N1, & N2);
				order(& N1, & N3);
				order(& N2, & N3);
                                      
    printf("These are the numbers in order: %.2lf %.2lf %.2lf\n",
               
               N1, N2, N3);

    return (0);
}
