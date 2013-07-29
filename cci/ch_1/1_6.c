// 1.6: Given an image represented by an NxN matrix, where each pixel in
// the image is 4 bytes, write a method to rotate the image by 90 degrees.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int rotate(int *, int, int);
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

  // We'll use an array of integers to represent the NxN
  // matrix, since ints are 4 bytes on this platform
  int arrayLength = strlen(charArray) - 1;
  int arrayWidth  = (int)(charArrayWidth[0] - 48);

  int array[arrayLength];

  int i;
  for (i = 0; i < arrayLength; i++)
  {
    array[i] = (int)(charArray[i] - 48);
  }

  printArray(array, arrayLength, arrayWidth);
  rotate(array, arrayLength, arrayWidth);

  free(charArray);
  free(charArrayWidth);

  return 0;
}

int rotate(int *array, int length, int width)
{
  // NxN requires a square matrix, e.g.
  // 1 2 3    7 4 1
  // 4 5 6 => 8 5 2
  // 7 8 9    9 6 3
  int rotatedArray[length];

  int row, column;
  for (row = 0; row < width; row++)
  {
    for (column = 0; column < width; column++)
    {
      rotatedArray[row * width + column] = array[((column + 1) * (width - 1) * width + row) % length];
    }
  }

  printArray(rotatedArray, length, width);
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

