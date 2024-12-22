#include<stdio.h>
#include<math.h>

int
main (void)
{
double side_a;
double side_b;
double perimeter = 0;
double area;

printf ("Enter legnth of the first shortest side of the right angle triangle: ");
scanf ("%lf", &side_a);
printf ("Enter legnth of the second shortest side of the right angle triangle: ");
scanf ("%lf", &side_b);

double side_c = sqrt((side_a*side_a +side_b*side_b));
perimeter = side_a + side_b + side_c;
area = (side_a*side_b)/2;

printf ("The perimeter of this right angle triangle is %.2lf units,", perimeter);
printf ("The area of this right angle triangle is %.2lf units squared,", area);
return (0);
}
