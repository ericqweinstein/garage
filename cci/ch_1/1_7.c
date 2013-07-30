// 1.7: Write an algorithm such that if an element in an MxN
// matrix is 0, its entire row and column are set to 0.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int checkForZeroes(int *, int, int);
int setRowAndColumnToZero(int *, int, int);
void printArray(int *, int, int);

int main(void)
{
  char buffer[100];
  char *charArray = malloc(sizeof(buffer) + 1);
  char *charArrayWidth = malloc(sizeof(buffer) + 1);

  printf("Array (enter as a string of integers): ");
  fgets(charArray, sizeof(buffer), stdin);

  printf("Width of each row (must be less than or equal to array length): ");
  fgets(charArrayWidth, sizeof(buffer), stdin);

  // We'll use an array of integers to represent
  // the MxN matrix, since 0 is a valid entry
  int arrayLength = strlen(charArray) - 1;
  int arrayWidth  = (int)(charArrayWidth[0] - 48);

  int array[arrayLength];

  int i;
  for (i = 0; i < arrayLength; i++)
  {
    array[i] = (int)(charArray[i] - 48);
  }

  printArray(array, arrayLength, arrayWidth);
  checkForZeroes(array, arrayLength, arrayWidth);

  free(charArray);
  free(charArrayWidth);

  return 0;
}

int checkForZeroes(int *array, int length, int width)
{
  int i;
  for (i = 0; i < length; i++)
  {
    if (array[i] == 0)
    {
      setRowAndColumnToZero(array, length, width);
      return 0;
    }
  }
  
  printf("No zeroes detected.\n");
  return 1;
}

int setRowAndColumnToZero(int *array, int length, int width)
{
  // We'll create an array of elements "marked" as
  // zeroes; 1 == "is zero," 0 == "is not zero"
  int marked[length];
  int element;
  for (element = 0; element < length; element++)
  {
    marked[element] = 0;
  }

  int i;
  for (i = 0; i < length; i++)
  {
    if (array[i] == 0)
    {
      marked[i] = 1;
    }
  }

  // For each 1 in the marked array, we'll set corresponding
  // value(s) in our array's row(s) and column(s) to zero
  int j, k, m, n;
  for (j = 0; j < length; j++)
  {
    if (marked[j] == 1)
    {
      // Set everything in our array's "marked" rows to zero
      k = j;
      while (k % width != 0)
      {
        k--;
      }
      for (m = k; m < k + width; m++)
      {
        array[m] = 0;
      }
      // Set everything in our array's "marked" columns to zero
      for (n = j; n < length * 2; n++)
      {
        if ((((n + width) % length) - j) % width == 0)
        {
          array[n] = 0;
        }
      }
    }
  }

  printArray(array, length, width);
  return 0;
}

void printArray(int *array, int length, int width)
{
  printf("Array:\n");

  int row;
  for (row = 0; row < length; row++)
  {
    printf("%d\t", array[row]);
    if ((row + 1) % width == 0)
    {
      printf("\n");
    }
  }
}

