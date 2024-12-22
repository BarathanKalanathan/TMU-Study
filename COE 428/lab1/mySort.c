void mySort(int d[], unsigned int n)
{
	int j;
	int x; // temporary number holder which swtiches the value in the array
    
	
    	for (j = 0; j < n - 1; ++j )
        {
        	if (d[j] > d[j+1])
            {
				x = d[j+1];
				d[j+1] = d[j];
				d[j] = x;
            }
			else 
			{
				d[j]=d[j];
				d[j+1]=d[j+1];
			}
        }
    }

