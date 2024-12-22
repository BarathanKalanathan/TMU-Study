#include<stdio.h>
#include<math.h>

double MO (double Speed, double *t1, double *t2) { // To moon
double PMO = 363104; // Perigee of moon
double APO = 405696; // Apogee of moon

*t1 = PMO / Speed;
*t2 = APO / Speed;
return 0;
}

double V (double Speed, double *t3 , double *t4) { // To Venus
double PV = 38000000; // Perigee of venus
double AV = 261000000; // Apogee of venus

*t3 = PV / Speed;
*t4 = AV / Speed;
return 0;
}


double MA (double Speed, double *t5, double *t6) { // To mars
double PMA = 54600000; // Perigee of mars
double APA = 401000000; // Apogee of mars

*t5 = PMA / Speed;
*t6 = APA / Speed;
return 0;
}


int main(void)
{
    double Speed;
    double t1;
    double t2;
    double t3;
    double t4;
    double t5; 
    double t6;
    
    int choice;
    printf ("1. Traveling to the Moon\n");
    printf ("2. Traveling to Mars\n");
    printf ("3. Traveling to Venus\n");
    printf ("4. Exit program\n");
    printf ("Enter a number: ");
    scanf ("%d", &choice);


    do {
        switch (choice) {
            case 1:
                
                printf ("Enter speed in km/h: ");
                scanf ("%lf", &Speed);
                
                MO(Speed, &t1, &t2);

              
                printf ("Perigee time to the Moon is: %.2lf hours.\n", t1);
                printf ("Apogee time to the Moon is: %.2lf hours.\n\n", t2);

                break;

            case 2:
                
                printf ("Enter speed in km/h: ");
                scanf ("%lf", &Speed);

				MA(Speed, &t5, &t6);
				
                printf ("Perigee speed to Mars is: %.2lf hours.\n", t5);
                printf ("Apogee speed to Mars is: %.2lf hours.\n\n", t6);

                break;
                
			case 3:
                printf ("Enter speed in km/h: ");
                scanf ("%lf", &Speed);

                V(Speed, &t3, &t4);

                printf ("Perigee speed to Venus is: %.2lf hours.\n", t3);
                printf ("Apogee speed to Venus is: %.2lf hours.\n\n", t4);

                break;

            case 4:
            break;
					}
					
				if (choice != 4) {
					
					printf ("1. Traveling to the Moon\n");
					printf ("2. Traveling to Mars\n");
					printf ("3. Traveling to Venus\n");
					printf ("4. Exit program\n");
					printf ("Enter a number: ");
					scanf ("%d", &choice);
        }
        
        
    } while (choice != 4);
    
    
    return 0;
}
