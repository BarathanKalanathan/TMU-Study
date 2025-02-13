#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/**
 *  The functions in this module implement a Stack data structure
 *  of char pointers (aka "strings").
 *
 *  NOTE: the stack is implemented as a fixed size array (size = 100).
 *  Consequently, no more than 100 strings can be pushed onto
 *  the Stack at any given time.
 */

// Implementation hints:
//   The 3 functions--push, pop and isEmpty--share information
//   about the array used to implement the stack and the index
//   of the "top" of the stack.
//
//   You may want to make these variables global...
//   ...but that would
//   be a mistake (because anyone using the module would have
//   to ensure that they did not use global variables with the
//   same names).
//
//   An alternative in C is a "static global".
//   If a global variable is qualified as "static", it is global only
//   within the source code file where it is declared.
//   In parituclar, it cannot conflict with any other global variable.
//
//  RECOMMENDATION:
//   Uncomment the following 2 lines and use these static globals!
static int top = 0;
static char * stack[100];
static int switch1 = 0;
/**
 * pop() removes the top string on the stack and returns it.
 *
 * If pop() is attempted on an empty stack, an error message
 * is printed to stderr and the value NULL ((char *) 0) is returned.
 */
void mem() // allocates memory for an array of character pointers in like a stack like behavior
{
    for (int i = 0; i < 100; i++) // iterates through the stack
	{
        stack[i] = malloc(10 * sizeof(char)); // allocates memory to store an array of 10 characters which includes null space as the terminator
    }
}

char *  pop() // pop an element or to remove an element from the top of the stack
{
    char* tempword = malloc(10 * sizeof(char));
    	if (top != 0) 
		{
        	top--;
        	strcpy(tempword, stack[top]);

        		for (int i = 0; i < 10; i++)  // clears current word
            		stack[top][i] = '\0';
        		return tempword; // string that was popped from the stack 
		}

    fprintf(stderr, "Error: there are no elements in the stack to pop!\n");
    return NULL;
}

/**
 *  push(thing2push) adds the "thing2push" to the top of the stack.
 *
 *  If there is no more space available on the Stack, an error
 *  message is printed to stderr.
 */
void push(char * thing2push) // add an element to the top of the stack
{
    if (switch1 == 0) // if memory is not allocated 
	{
		mem(); // calls function mem
        switch1++; // indicates that memory has been allocated
    }

    if (top == 100) // stack is full
	{
        fprintf(stderr, "Error: there is no more space in the stack to add any more elements!\n");
	}

    else //adds the string to the top of the stack 
	{
        strcpy(stack[top], thing2push);
        top++;
    }
}

/**
 * isEmpty() returns a non-zero integer (not necessarily 1) if the
 * stack is empty; otherwise, it returns 0 (zero).
 *
 */
int isEmpty() // checks if the top of the stack is empty
{
    if (top == 0) 
	{
        return 1; // it is empty and is valid
    } 

	else 
	{
        return 0; // Returns false and stack is not empty and not valid
    }
}
