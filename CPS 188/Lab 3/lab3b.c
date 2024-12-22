#include <stdio.h>
#include<math.h>


int main(void)
{
  double Weight;
  double Height;
  double BMI;


  printf ("Enter Weight (kg) ");
  scanf ("%lf", & Weight);
    
  printf ("Enter Height (m) ");
    scanf ("%lf", & Height);
    
  BMI = (Weight/(Height*Height));
    
  if (BMI < 18.5) {
    printf ("BMI is %.2lf, which means the subject is underweight.", BMI);
    
  } else if (BMI >= 18.5 && BMI < 25) {
    printf ("BMI is %.2lf, which means the subject is under normal weight.", BMI);
    
  } else if (BMI >= 25 && BMI < 30) {
    printf ("BMI is %.2lf, which means the subject is overweight.", BMI);
    
  } else {
    printf ("BMI is %.2lf, In other words the subject is obese.", BMI);
  }
  
  
  return 0;
}
