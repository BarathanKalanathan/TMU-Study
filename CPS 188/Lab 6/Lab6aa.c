#include <stdio.h>
#include <math.h>

int main(void)
{
    double Array [30];
    double N_Array[30]; // Normailized Array
    double Min; 
    double Max;
    double Low; 
    double High; 

    FILE *a;
    a = fopen ("a.txt", "r");
		int i, Count;

		fscanf (a, "%d%lf%lf", &Count, &Min, &Max);
	
		High = Array [0];
		Low = Array [0];
    
    for (i = 0; i < Count; ++i) {
        fscanf (a, "%lf", &Array[i]);

			if (Array [i] > High) 
			
			{
            High = Array [i];
		}
		
		
         else 
         {
            if (Array [i] < Array [i-1]) 
            
            {
                Low = Array [i];
            }
        }

    }

    for (i = 0; i < Count; ++i)
    
    {
        N_Array [i] = (((Max - Min)*(Array [i] - Low) + Min)) / (High - Low);
    }

    printf ("original value    |    Normalized value\n");
    printf ("________________________________________\n");

    for (i =  0; i < Count; ++i) 
    
    {

        printf("     %.2lf                 %.2lf       \n", Array [i], N_Array[i]);
    }
    
    
    fclose (a);
    return (0);
}
