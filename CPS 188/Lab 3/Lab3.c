#include<stdio.h>
#include<math.h>

int
main (void)
{
double Gender;
double Male; 
double Female;
double Age;
double RHR;
double F; 
double MHR;
double c;

printf ("Enter age.");
scanf ("%lf", & Age);

printf ("Enter Male or Female?");
scanf ("%lf", & Gender);

	if (Gender == 'Male')
		MHR = 203.7/(1+pow(2.71828183,(0.033*(Age-104.3))));
	
	else
		MHR = 203.7/(1+pow(2.71828183,(0.033*(Age-104.3))));
	
	
	
Male = (Gender == Male);
Female = (Gender == Female);



printf ("Enter Resting Heart Rate.");
scanf ("%lf", & RHR);


printf ("Enter fitness level as L for low, M for Medium or H for High level of activity.");
scanf ("%lf", & F);



return(0);
}





