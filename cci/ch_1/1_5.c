// 1.5: Implement a method to perform basic string compression using the counts
// of repeated characters. For example, the string aabcccccaaa would become
// a2b1c5a3. If the "compressed" string would not become smaller than the
// original string, your method should return the original string.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STRING_LENGTH 100

int compress(char *);

int main (int argc, char *argv[])
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

  compress(argv[1]);
  return 0;
}

int compress(char *str)
{
  int stringLength = strlen(str);

  char *compressedString = malloc(sizeof(char) * MAX_STRING_LENGTH);

  int charRepeatCount = 1;

  int i;
  for (i = 0; i < stringLength; i++)
  {
    if (str[i] == str[i + 1])
    {
      // If the current character is the same as the
      // next one, just increment the repeat count
      charRepeatCount++;
    }
    else
    {
      // As soon as we see a new character, combine the
      // current one and a char representing the repeat
      // count (this will only work for repeat counts in
      // [1..9]) and concatenate that to compressedString.
      char *charAndCount = malloc(sizeof(char) * 3);
      memset(charAndCount, str[i], 1);
      memset(charAndCount + 1, charRepeatCount + 48, 1);
      memset(charAndCount + 2, '\0', 1);
      strcat(compressedString, charAndCount);

      // Reset for the new character
      charRepeatCount = 1;
      free(charAndCount);
    }
  }

  char *result = strlen(str) < strlen(compressedString) ? str : compressedString;

  printf("%s\n", result);

  free(compressedString);
  return 0;
}

