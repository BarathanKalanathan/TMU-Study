#include <stdio.h>
#define STACK_EMPTY '0'
#define STACK_SIZE 20

void
push(char stack[],    /* input/output - the stack */
     char item,       /* input - data being pushed onto the stack */
     int  *top,       /* input/output - pointer to top of stack */
     int  max_size)   /* input - maximum size of stack */
{
     if (*top < max_size-1) {
         ++(*top);
         stack[*top] = item;
     }
}

char
pop (char stack[],    /* input/output - the stack */
    int *top)        /* input/output - pointer to top of stack */
{
    char item;       /* value popped off the stack */

    if (*top >= 0) {
        item = stack[*top];
        --(*top);
    } else {
         item = STACK_EMPTY;
    }

    return (item);
}

int
main (void)
{
    char s [STACK_SIZE];
    
    
		int w, x, y, z; 
		int i; 
		char answer = '\0';
		int t = -1;
    
			printf("Enter 4 Numbers with spaces in between: \n");
			scanf("%d %d %d %d", &w, &x, &y, &z);
    
    while (answer != '3' ) {
        
        printf("\n");
        printf("Choose '1' for push or choose '2' for pop or choose '3' to exit program.: \n");
        scanf(" %c", &answer);
        
        
        if (answer == '3') {
            printf("Program is now closed\n");
        } else {
            switch (answer) {
            case '1':
                    push (s, w, &t, STACK_SIZE);
                    push (s, x, &t, STACK_SIZE);
                    push (s, y, &t, STACK_SIZE);
                    push (s, z, &t, STACK_SIZE);
                    
					printf ("Push\n");
                    printf("\n");
                    printf("stack: ");
                    printf("\n");
                
                    for (i = t; i > -1; --i) {
                        printf("%d\n", s[i]);
                    
                    }
                    break;
            case '2':
                    
                    pop(s, &t);
					printf ("Pop\n");
                    for (i = t; i > -1; --i) {
                        
                        printf("\n");
                        printf("%d", s[i]);
                    }
                    break;
            }
        }
    }
    return (0);
}
