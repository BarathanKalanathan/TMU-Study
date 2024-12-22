#include<stdio.h>
#include<math.h>


int 
 main (void)

{	
int Hrs_Worked =0; //* Hrs means hours worked
int dataf, EMP_Number;
int Hrs_Per_Shift =0;
double Wage = 0;
double shifts = 0;
double Gross_Wage = 0;

FILE*data;
data = fopen("L4_data.txt","r");
dataf = fscanf(data, "%d%lf%lf", & EMP_Number, & shifts, & Wage);

printf("Employee # | Total Hours Worked | Gross Pay\n");
printf ("--------------------------------------\n");

while (dataf!=EOF)

	{for (int i=1; i<=shifts; i++)
		
			{   dataf = fscanf(data, "%d", & Hrs_Per_Shift);
				Hrs_Worked = Hrs_Worked +  Hrs_Per_Shift;	
			}
			
			if (Hrs_Worked <=15)
					
					{   Gross_Wage = Wage * Hrs_Worked;
						printf("%d           |         %d         |      $%.2lf\n", EMP_Number, Hrs_Worked, Gross_Wage);
					}
			
				else
						if (Hrs_Worked >25)
			
						{   Gross_Wage = ((Wage * 1.10) * Hrs_Worked);
						printf("%d           |         %d         |      $%.2lf\n", EMP_Number, Hrs_Worked, Gross_Wage);
						}
					
					else
				
						{   Gross_Wage = ((Wage * 1.05) * Hrs_Worked);
							printf("%d           |         %d         |      $%.2lf\n", EMP_Number, Hrs_Worked, Gross_Wage);
						}
							
	dataf = fscanf(data, "%d%lf%lf", & EMP_Number, & shifts, & Wage);
	Hrs_Worked = 0;
	
}

fclose (data);
return (0);

}
