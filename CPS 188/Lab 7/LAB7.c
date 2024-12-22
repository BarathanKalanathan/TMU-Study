#include <stdio.h>
#include <string.h>
#include <ctype.h>

void reverse(char original[], char reversed[]) // Reverses the letters in the word or phrase
{
   
    int originalLength = strlen(original);
		
		if (originalLength > 0){
			char temp = original[originalLength - 1];
        
        
				original[originalLength - 1]= '\0';
				reversed[strlen(reversed)]=temp;
				reverse(original,reversed);
    }
}


void strip(char original[], char stripped[]) // Strips the capital letters to lowercase
{
    
    int max = strlen(original);
    
    
    for (int i=0; i<max; i++)
    {
        
        char temp = original[i];
        
				if(isalpha(temp) || isdigit(temp)) // To remove punctuations
				{
					if(isupper(temp))
					{
                
                temp=tolower(temp);
					}
            
				stripped[strlen(stripped)]=temp;
				}
     }
}



int main(void)

{
    int size = 100;
    
    char original[size], stripped[size], reversed[size];
    
    for (int i=0; i<size; i++)
    
    {
        
			original[i]= '\0';
			stripped[i]= '\0';
			reversed[i]= '\0';
			
    }
		printf ("Please enter a phrase that you think is a palindrome:");
		
		fgets(original,size,stdin);
		
		strip(original, stripped);
		
		printf("%s\n", stripped);

		reverse(stripped, reversed);
		
		strip(original, stripped);
		
		printf("%s\n", reversed);


        if (strcmp(reversed, stripped) == 0)
        {
       
        printf("This phrase is a Palindrome.");
        
        }
			else{
			
			printf("This phrase is not a palindrome.");
		}
    
return 0;
}



