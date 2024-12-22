#include <stdio.h>
#include <math.h>

struct address_t
{
    char Names[15];
    int aa, bb, cc, dd;
};

int localnet(struct address_t IP1, struct address_t IP2)

    {
        if (IP1.aa == IP2.aa && IP1.bb == IP2.bb)
            return 1;
    }
    
int main(void)
{
    FILE *file = fopen("c.txt", "r"); // Open file
    struct address_t IP[250];
    int i= 0;
    while (!feof(file))
    
    {
        fscanf(file, "%d.%d.%d.%d %s", &IP[i].aa, &IP[i].bb, &IP[i].cc, &IP[i].dd, IP[i].Names);
        printf("\n%d.%d.%d.%d %s\n", IP[i].aa, IP[i].bb, IP[i].cc, IP[i].dd, IP[i].Names);
        if (IP[i].aa == 0)
        
        {
            break;
        }
        
        i++;
    }
    
    for (int j = 0; j < i; j++)
        {
            for (int l =j+1; l < i; l++)
            {
                double Answer = localnet(IP[j], IP[l]);
                
                if (Answer == 1)
                {
                printf("\n\n\n Names %s and %s are in corresponding Network", IP[j].Names, IP[l].Names);
                }
            }
        
        }
        

        
    return 0;
}
