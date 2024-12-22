#include <stdio.h>
#include <math.h>

int main(void)
{
  char Gender;
  char fitness;
 
 
  double Age;
  double RHR;
  double THR;
  double MHR_m;
  double MHR_f;
  double LOW;
  double MEDIUM;
  double HIGH;
  
    
  LOW = 0.55;
  MEDIUM = 0.65;
  HIGH = 0.8;
   
  printf ("Enter Male (M) or Female (F): ");
  scanf ("%c", &Gender);
  
  printf ("Enter Age: ");
  scanf ("%lf", &Age);
   
  printf ("Enter Resting Heart Rate: ");
  scanf ("%lf", &RHR);
    
  printf ("Enter fitness level as L for low M for medium or H for high");
  scanf (" %c", &fitness);
    
  if (Gender == 'M') {
    MHR_m = 203.7/(1+exp(0.033 * (Age-104.3)));
   
    if (fitness == 'L') {
      THR = (MHR_m - RHR) * LOW + RHR;
   
    } else if (fitness == 'H') {
      THR = (MHR_m - RHR) * HIGH + RHR;
   
   } else {
      THR = (MHR_m - RHR) * MEDIUM + RHR;
    }
 
  } else {
    MHR_f = 190.2/(1+exp(0.0453 * (Age-107.5)));
   
  
    if (fitness == 'L') {
      THR = (MHR_f - RHR) * LOW + RHR;
   
   
    } else if (fitness == 'H') {
      THR = (MHR_f - RHR) * HIGH + RHR;
   
    } else {
      THR = (MHR_f - RHR) * MEDIUM + RHR;
    }
  }
    
  int rounded_THR = round(THR);
  printf ("Training heart rate is %d", rounded_THR); 
   
  return 0;
}
