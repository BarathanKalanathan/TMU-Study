#include <stdio.h>
#include <stdlib.h>

extern int pop();
extern void push(int);
extern int isEmpty();

static int heap[100];
static int size = 0;

/**
 *  The functions in this module implement a Heapdata structure
 *  of integers.
 */
void Bigint(int heap[], int size, int num); // declare Bigint function

/**
 * heapDelete() removes the biggest integer in the heap and returns it.
 *
 */

int heapDelete() 
{
    if (size == 0) 
	{
        fprintf(stderr, "There is nothing to delete");
        exit(1);
    }

    int maxval;
    maxval = heap[0]; // Deletes maxvalue of the heap
    heap[0] = heap[size - 1]; // assigns the next value of the heap
    size--;
    Bigint(heap, size, 0); // Reheapifies 
    return maxval;
}

/**
 *  addHeap(thing2add) adds the "thing2add" to the Heap.
 *
 */
void addHeap(int thing2add) {
    heap[size] = thing2add; // added to the heap
    size++; // increases the size
}

/**
 * heapSize() returns the number of items in the Heap.
 *
 */
int heapSize()
{
  return size;  
}

void Bigint(int heap[], int size, int num) 
{
    int parent = num;
    int Leftchild = (2 * num) + 1;
    int Rightchild = (2 * num) + 2;

    if (Leftchild < size && heap[Leftchild] > heap[parent]) 
	{
        parent = Leftchild;
    }

    if (Rightchild < size && heap[Rightchild] > heap[parent]) 
	{
        parent = Rightchild;
    }

    if (parent != num) // swaps the values of the parent node and the child node with the maximum value
	{
        int temp = heap[num];
        heap[num] = heap[parent];
        heap[parent] = temp;
        Bigint(heap, size, parent); // recursive call to repeat until the parent is equal to the number
    }
}

void fullMaxHeapify() 
{
    for (int i = (size / 2) - 1; i >= 0; i--) // iterates through each node with at least one child in the heap array
        Bigint(heap, size, i); // Calls function Bignit
}

void heapSortPushStack() 
{
    for (int i = (size / 2) - 1; i >= 0; i--) // Heapifies the array 
	{
        Bigint(heap, size, i);
    }

    for (int i = size - 1; i >= 0; i--) // Heap sorts puts the elements in ascending order 
	{
        push(heap[0]);
        printf("%d\n", heap[0]);

        int temp = heap[0];
        heap[0] = heap[i];
        heap[i] = temp;

        Bigint(heap, i, 0);
    }
}

void printNode(int size, int num) // Prints the node
{
    int parent = num;
    int left = 2 * num + 1;
    int right = 2 * num + 2;
    if (parent < size)
        printf("<node id=%d>", heap[parent]);

    if (left < size)
        printNode(size, left);

    if (right < size)
        printNode(size, right);

    if (parent < size)
        printf("</node>");
}

