#include <stdio.h>
#include <math.h>

int main(void)
{
    
double Quiz_mark; 
double Quiz_mark1;
double Avg1;     // Average 1 is the addition of all 10 quiz makrs and avg is average quiz mark without the lowest score.
double Avg;
double lownumber; // to find lowest score quiz.
double OQmark; //Old quiz mark
double sum;
double Midterm;
double Final_exam;
double Final_mark;


printf ("Enter quiz 1 mark: ");
scanf ("%lf", &Quiz_mark1);


lownumber = Quiz_mark1; 
sum = Quiz_mark1;  

int Quiz_number = 2;
while (Quiz_number <= 10) { 
    printf ("Enter quiz %d mark: ", Quiz_number);
    scanf ("%lf", & Quiz_mark);
    Quiz_number++; 
    
    sum = sum + Quiz_mark; 
    
    OQmark = Quiz_mark; 
    
    if (lownumber > OQmark) { 
        lownumber = Quiz_mark;
    }
    
    Avg1 = sum - lownumber;
    Avg = Avg1 / 9;
  }
  
  
  
  printf ("\nEnter your Midterm mark: ");
  scanf ("%lf", & Midterm);
  printf ("\nEnter your Final exam mark: ");
  scanf ("%lf", & Final_exam);
  
  if (Midterm < Final_exam) { 
    Final_mark = ((Avg*2.5) + (Midterm*0.25) + (Final_exam*0.5));
    
  } else {
    Final_mark = ((Avg*2.5) + (Midterm*0.35) + (Final_exam*0.40));
  }

  printf ("\nFinal Mark is: %.2lf.", Final_mark);
  
  
  return 0;
}
