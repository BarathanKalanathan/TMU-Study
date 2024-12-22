#include <stdlib.h>
#include <stdio.h>
#include <string.h>


typedef struct
{
    char name;
    int nextState[2];
    int deleted;
    int visited;
} State;



void isReachableHelper(State states[], int currentStateIndex)
{
	if (states[currentStateIndex].visited == 1 || states[currentStateIndex].deleted == 1) 
	{
        return;// Already visited, stop recursion
    }
    
	if(states[currentStateIndex].visited == 0)
	{
        states[currentStateIndex].visited = 1;
        int state0 = states[currentStateIndex].nextState[0];
        int state1 = states[currentStateIndex].nextState[1];
        isReachableHelper(states, state0);
        isReachableHelper(states, state1);
    } 
}

void isReachable(State states[], int currentStateIndex)
{
	for(int i = 0; i <8; i++)
	{
    	states[i].visited = 0;//Mark all states as not visited
    }
	isReachableHelper(states, currentStateIndex);
}

int main(int argc, char * argv[])
{
    char command[10];
    int input;
    char change;

    State states[8]; // 8 States are created for A B C D E F G H

    states[0].name = 'A';
    states[1].name = 'B';
    states[2].name = 'C';
    states[3].name = 'D';
    states[4].name = 'E';
    states[5].name = 'F';
    states[6].name = 'G';
    states[7].name = 'H';

	// Next state for each states when inputing 0 or 1
    states[0].nextState[0] = 4;
    states[0].nextState[1] = 3;
    
    states[1].nextState[0] = 0;
    states[1].nextState[1] = 5;
    
    states[2].nextState[0] = 6;
    states[2].nextState[1] = 2;
    
    states[3].nextState[0] = 2;
    states[3].nextState[1] = 0;

    states[4].nextState[0] = 1;
    states[4].nextState[1] = 2;
    
    states[5].nextState[0] = 3;
    states[5].nextState[1] = 7;
    
    states[6].nextState[0] = 5;
    states[6].nextState[1] = 7;
    
    states[7].nextState[0] = 1;
    states[7].nextState[1] = 4;
    
    int currentStateIndex = 2; // Current State which is C

    for(int i = 0; i < 8; i++) // For each state setting the value of deleted to 0, indicates that none of the states are deleted
	{
        states[i].deleted = 0;
    }

    	printf("Curent State: %c\n", states[currentStateIndex].name);

    while (scanf("%s", command) != EOF) //Code runs while until an input is typed 
	{
        if(strcmp(command, "0") == 0 || strcmp(command, "1") == 0) // 0 and 1 command for next state
		{
            input =  atoi(command);
            currentStateIndex = states[currentStateIndex].nextState[input];
			printf("Current State ");
            printf("%c\n", states[currentStateIndex].name);
        }

        else if(strcmp(command, "c") == 0) // c command to change state
		{
            scanf(" %d %c", &input, &change);
            if(states[change - 'A'].deleted == 1) // check if state has been deleted
			{
                printf("Cannot assign deleted state. \n");
            }
            else{
                states[currentStateIndex].nextState[input] = change - 'A';
            }
        }

        else if(strcmp(command, "p") == 0) //p command to show all states and it's corresponding next states
		{
            for(int i = 0; i < 8; i++)
			{
                if(states[i].deleted == 0)// if states are not deleted
				{
                    printf("%c ", states[i].name);
                    printf("%c ", states[states[i].nextState[0]].name);
                    printf("%c\n", states[states[i].nextState[1]].name);
                }
            }
            
        }

        else if(strcmp(command, "g") == 0) // the garbage command checks for unvisited states
		{
			isReachable(states, currentStateIndex); // Calls isReachable function
            int unreachable = 0; //Check count of unreachable

            for(int i = 0; i<8; i++)
			{
                if(states[i].visited == 0 && states[i].deleted == 0) // if states are not visited and not deleted
				{
                    unreachable = 1;
                    break;
                }
            }

            if(unreachable > 0)
			{
            	printf("Garbage Collection: ");

                for(int i = 0; i<8; i++)
				{
                    if(states[i].visited == 0 && states[i].deleted == 0)
					{
                        printf("%c ", states[i].name);
                    }
                }

                printf("\n");
            }

            else
			{
                printf("There Are No Garbage\n");
            }
        }

        else if(strcmp(command, "d") == 0) // d command which is used to delete all garbage or a state
		{
            char stateToDelete;
            int StateIndex;

            if(scanf(" %c", &stateToDelete) == 1)
			{
                StateIndex = stateToDelete - 'A';

                if (states[StateIndex].deleted == 1)
				{
                    printf("Not deleted.");
                }

                else
				{
                    states[StateIndex].deleted = 1;
                    printf("Deleted.");
                }
            }

            else
			{
                isReachable(states, currentStateIndex);
                int deletedUnreachable = 0;

                for(int i = 0; i < 8; i++)
				{
                    if (states[i].visited == 0 && states[i].deleted == 0) 
					{
                        deletedUnreachable += 1;

                        if(deletedUnreachable == 1)
						{
                            printf("Deleted: ");
                        }
                        states[i].deleted = 1;
                        printf("%c ", states[i].name);
                    }
                }

                if (!deletedUnreachable) 
				{
                    printf("No states deleted.");
                }
            }

            printf("\n");
        }
    }

    exit(0);
}
