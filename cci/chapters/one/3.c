// 1.3: Given two strings, write a method to decide if one is a permutation of the other.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STRING_LENGTH 100

int stringsAreAnagrams(char *, char *);

int main(int argc, char *argv[])
{
  if (argv[1] == NULL || argv[2] == NULL)
  {
    printf("Two string arguments are required.\n");
    exit(-1);
  }

  if (strlen(argv[1]) > MAX_STRING_LENGTH || strlen(argv[2]) > MAX_STRING_LENGTH)
  {
    printf("At least one string argument is too long (%d characters max).\n", MAX_STRING_LENGTH);
    exit(-1);
  }

  stringsAreAnagrams(argv[1], argv[2]);
  return 0;
}

int stringsAreAnagrams(char *str1, char *str2)
{
  int stringOneLength = strlen(str1);
  int stringTwoLength = strlen(str2);

  if (stringOneLength != stringTwoLength)
  {
    printf("Strings are not permutations of one another.\n");
    return 1;
  }

  int stringOneAlphabet[122] = { 0 };
  int stringTwoAlphabet[122] = { 0 };

  for (int i = 0; i < stringOneLength; i++)
  {
    stringOneAlphabet[str1[i]]++;
    stringTwoAlphabet[str2[i]]++;
  }

  int i, length;
  for (int i = 0, length = sizeof(stringOneAlphabet) / sizeof(stringOneAlphabet[0]); i < length; i++)
  {
    if (stringOneAlphabet[i] != stringTwoAlphabet[i])
    {
      printf("Strings are not permutations of one another.\n");
      return 1;
    }
  }

  printf("Strings are permutations of one another.\n");
  return 0;
}
