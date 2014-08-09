// 1.2: Implement a function void reverse(char *str)
// in C or C++ that reverses a null-terminated string.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STRING_LENGTH 100

void reverse(char *);

int main(int argc, char *argv[])
{
  if (argv[1] == NULL)
  {
    printf("No string argument supplied.\n");
    exit(-1);
  }

  if (strlen(argv[1]) > MAX_STRING_LENGTH)
  {
    printf("String is too long (%d characters max).\n", MAX_STRING_LENGTH);
    exit(-1);
  }

  reverse(argv[1]);
  return 0;
}

void reverse(char *str)
{
  printf("Original string: %s\n", str);
  int stringLength = strlen(str);

  char *backwards = malloc(sizeof(char) * stringLength);

  int i, j;
  for (i = 0, j = stringLength - 1; i < stringLength; i++, j--)
  {
    backwards[i] = str[j];
  }

  printf("Reversed string is: %s\n", backwards);
}
