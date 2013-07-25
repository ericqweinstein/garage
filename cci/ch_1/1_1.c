// 1.1: Implement an algorithm to determine if a string has all unique characters.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int stringHasAllUniqueChars(void);

int main(void)
{
  stringHasAllUniqueChars();
  return 0;
}

int stringHasAllUniqueChars(void)
{
  // The ASCII values of A - Z are 65 - 90
  // The ASCII values of a - z are 97 - 122

  // Initialize an array of all zeroes
  int alphabet[122] = { 0 };
  
  char buffer[100];
  char *str = malloc(sizeof(buffer) + 1);

  printf("String to check (strings > 100 characters will be truncated): ");
  fgets(str, sizeof(buffer), stdin);

  int stringLength = strlen(str);

  for (int i = 0; i < stringLength; i++)
  {
    // C chars are ints, so each character can be looked
    // up implicitly by its ASCII value (see ll. 17 - 18)
    if (alphabet[str[i]] > 0)
    {
      printf("String contains repeating letter: %c\n", str[i]);
      return 0;
    }
    else
    {
      alphabet[str[i]]++;
    }
  }

  printf("String contains no repeating letters.\n");
  free(str);
  return 1;
}

