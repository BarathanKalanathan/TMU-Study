#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern char *pop();
extern void push(char *);
extern int isEmpty();
extern void mem(char **stack);

int main(int argc, char *argv[]) {
    char ch;  // Input from stdin
    char chNext;
    char *topWord = malloc(10 * sizeof(char));  // Word at the top of the stack
    char *word = malloc(10 * sizeof(char));     // Current word to be popped or pushed

    while ((ch = getchar()) != EOF) // reads characters from input until end of file 
	{
        if (ch == '\n')  // Stop the while loop if no more inputs
		{
            break;
		}

        if (!(isalpha(ch) || ch == '>' || ch == '<' || ch == '/'))  // If input is not a letter and does not contains >, <, or /, skip current while loop
            continue; // goes back to the beginning of the loop

        if (ch == '<') // If current input is <, then it will check if the next input does or doesnt include /
		{  
            chNext = getchar();
            if (chNext == '/') // If input is /, compare with top of the stack and pop
			{  
                int a = 0;
                chNext = getchar();

                do 
				{
                    word[a] = chNext;
                    a++;
                    chNext = getchar();
                } 

				while (chNext != '>');
					topWord = pop();

                	if (strcmp(word, topWord) != 0) // Check if the the current word is equal to the top word.
					{  
                    	fprintf(stderr, "Error: Cannot pop an element that is not at the top of the stack!\n");
                    	exit(1);
                	}

            } 

			else // If input is not /, push the word into the stack
			{  
                int a = 0;
                do 
				{
                    word[a] = chNext;
                    a++;
                    chNext = getchar();

                } 

				while (chNext != '>');
                	push(word);
            }

            for (int i = 0; i < 10; i++)  // Resets the word array
                word[i] = '\0';
        }
    }
    
	if (isEmpty()) // checks if stack is empty 
	{  
        fprintf(stdout, "Stack is empty, it is valid.\n");
        exit(0);
    } 

	else 
	{
        fprintf(stderr, "Stack is not empty, it is invalid.\n");
        exit(1);
    }
    return 0;
}
