#include <stdio.h>

// arranges arguments in ascending order
// smp and lgp are addresses double variables.
// variable pointed to by small contains the smaller
// variable pointed to by big contains the larger
void
order(double *small, double *big)
{
    double temp; // temporary variable for the swap
    
    if (*small > *big) 
    {
        temp = *small;
        *small = *big;
        *big = temp;
    }
}
   

int
main (void)
{
    double num1, num2, num3;

    printf("Enter three numbers separated by blanks > ");
    scanf(" %lf %lf %lf", &num1, &num2, &num3);

    // Orders the three numbers
    order(&num1, &num2);
    order(&num1, &num3);
    order(&num2, &num3);
                                      
    printf("The numbers in ascending order are: %.2lf %.2lf %.2lf\n",
               num1, num2, num3);

    return (0);
}
