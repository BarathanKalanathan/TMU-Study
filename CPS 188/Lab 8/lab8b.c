#include <stdio.h>
#include <math.h>
#include "mylibrary.h"

int main(void)
{
    FILE *file = fopen("b.txt", "r");
        
        double A[10][10]; //The Matrix which includes the 100 numbers in a 10 by 10 array 
        int row = 0;
        int col = 0;
    
    while (!feof(file))
        {
            fscanf(file, "%lf", &A[row][col]);
            col++;
                     
                if (col > 9)
                {
                    col = 0;
                    row++;
                }
        }
    
        double b =sumdiag(A); // b represents the sum of the diagonal numbers in the matrix 
        
        double c =sumall(A); // c represents the sum of all the numbers in the matrix 
        
        double d =avright(A); // d represents the average of the numbers in the right most column (column 10 technically 9) 
        
        double e =corners(A); // e represents the sum of the four numbers in the corners of the matrix 
        
        double f =largeanti(A); // f represents the largest number in the antidiagonal in the matrix 
        
        
    
            printf("\nSum of the diagonal in the matirx: %0.1f\n", b);
            
            printf("\nSum of all the numbers in the matrix: %0.1f\n", c);
            
            printf("\nAverage of the numbers in the right most column in the matrix: %0.1f\n", d);
            
            printf("\nsum of the four numbers in the corners of the matrix:  %0.1f\n", e);
            
            printf("\nlargest number in the antidiagonal in the matrix: %0.1f\n\n", f);
    
    fclose(file);
    
    FILE* result = fopen("results.bin", "wb"); // To insert numbers into results.bin
    
            fprintf(result, "%0.1f\n", b);
            
            fprintf(result, "%0.1f\n", c);
            
            fprintf(result, "%0.1f\n", d);
            
            fprintf(result, "%0.1f\n", e);
            
            fprintf(result, "%0.1f\n", f);
            
            
		fclose(result);
    
    
    return 0;
}
