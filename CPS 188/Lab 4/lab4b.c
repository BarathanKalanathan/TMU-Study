#include<stdio.h>
#include<math.h>


int 
 main (void)

{	
int hours_worked =0;
int dataf;
int emp_num;
int hours_per_shift =0;

double gross_wage = 0;
double wage = 0;
double shifts = 0;

FILE*data;
data = fopen("L4_data.txt","r");
dataf = fscanf(data, "%d%lf%lf", &emp_num, &shifts, &wage);

printf("Employee # | Total Hours Worked | Gross Pay\n");
printf ("--------------------------------------\n");

while (dataf!=EOF)

	{
		for (int i=1; i<=shifts; i++)
		
			{
				dataf = fscanf(data, "%d", &hours_per_shift);
				hours_worked = hours_worked + hours_per_shift;
				
			}
			
			if (hours_worked >25)
			{
				gross_wage = ((wage*1.10)*hours_worked);
				printf("%d           |         %d         |      $%2lf\n", emp_num, hours_worked, gross_wage);
				
			}
			
				else
					if (hours_worked <=15)
					
					{
						gross_wage = wage*hours_worked;
						printf("%d           |         %d         |      $%2lf\n", emp_num, hours_worked, gross_wage);
					}
					
					else
				
						{
							
						gross_wage = ((wage*1.05)*hours_worked);
						printf("%d           |         %d         |      $%2lf\n", emp_num, hours_worked, gross_wage);
						
					}
							
	dataf = fscanf(data, "%d%lf%lf", &emp_num, &shifts, &wage);
	hours_worked = 0;
	
}

fclose (data);
return (0);

}
