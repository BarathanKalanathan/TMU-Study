#include<stdio.h>
#include<math.h>

int
main (void)
{
double a;
double b;
double c;





b=100;

printf("Enter Male or Female:");
scanf ("%lf", & c); 

if (c == 'Male'){
	a = 203.7/(1+pow(exp,(0.033*(b-104.3))));
	
	else 
	a = 190.2/(1+pow(exp,(0.0453*(b-107.5))));

	


printf("a equals to %.2lf\n.", a);



return(0);
}
