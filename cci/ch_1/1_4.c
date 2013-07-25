// 1.4: Write a method to replace all spaces in a string with '%20'.
// You may assume that the string has sufficient space at the end to
// hold the additional characters, and that you are given the "true"
// length of the string.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// For our purposes, we'll assume 100 characters is sufficient space
#define MAX_STRING_LENGTH 100

int replaceAllSpacesWithPercent20(char *);

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

  replaceAllSpacesWithPercent20(argv[1]);
  return 0;
}

int replaceAllSpacesWithPercent20(char *str)
{
  int stringLength = strlen(str);

  // Assuming 100 characters afforded sufficient space,
  // this ensures we have padding to the end of our string
  char buffer[MAX_STRING_LENGTH];
  strncpy(buffer, str, MAX_STRING_LENGTH);

  // I interpret the instructions as requiring that the
  // replacement be done in-place, so that's what we'll do
  int i, j;
  for (i = 0; i < stringLength; i++)
  {
    // ASCII <Space> : 32
    // ASCII % : 37
    // ASCII 2 : 50
    // ASCII 0 : 48
    if (buffer[i] == 32)
    {
      for (j = stringLength + 2; j > i; j--) {
        // Move everyone down two spots to make
        // room for the extra two characters
        buffer[j] = buffer[j - 2];
      }
      buffer[i] = 37;
      buffer[i + 1] = 50;
      buffer[i + 2] = 48;

      // Update the length of our string, which
      // is now two characters longer than before
      stringLength += 2;
    }
  }

  printf("%s\n", buffer);
  return 0;
}

