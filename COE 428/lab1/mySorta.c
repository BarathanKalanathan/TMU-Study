void mySort(int d[], unsigned int n)
{
	int i, x, j;
    for (i = 1; i < n; i++) 
	{
        x = d[i];
        j = i - 1;

        while (j >= 0 && d[j] > x) {
            d[j + 1] = d[j];
            j = j - 1;
        }
        d[j + 1] = x;
	}
}

