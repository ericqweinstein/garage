// 1.8: Assume you have a method isSubstring that checks if one word is a
// substring of another. Given two strings, s1 and s2, write code to
// check if s2 is a rotation of s1 using only one call to isSubstring
// (e.g. "waterbottle" is a rotation of "erbottlewat").

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STRING_LENGTH 50

int isSubstring(char *, char *);
int isRotation(char *, char *);

int main(void)
{
  char buffer[MAX_STRING_LENGTH];
  char *stringOneWithNewline = malloc(sizeof(buffer) + 1);
  char *stringTwoWithNewline = malloc(sizeof(buffer) + 1);

  printf("String one (50 characters max): ");
  fgets(stringOneWithNewline, sizeof(buffer), stdin);

  // If the input comprises only the newline character
  if (strlen(stringOneWithNewline) == 1)
  {
    printf("String must have a non-zero length.\n");
    exit(-1);
  }

  // This looks weird, but all it does is tokenize the string
  // on newlines, thereby removing the final "\n" from input
  //
  // I'm reasonably sure strtok isn't thread safe, which is
  // okay for this implementation. For a reentrant (thread
  // safe) version, see strtok_r (under `man strtok`)
  char *stringOne = strtok(stringOneWithNewline, "\n");

  printf("String two (50 characters max): ");
  fgets(stringTwoWithNewline, sizeof(buffer), stdin);

  if (strlen(stringTwoWithNewline) == 1)
  {
    printf("Strings must have a non-zero length.\n");
    exit(-1);
  }

  char *stringTwo = strtok(stringTwoWithNewline, "\n");

  isRotation(stringOne, stringTwo);

  return 0;
}

int isSubstring(char *s1, char *s2)
{
  // Might as well implement isSubstring
  //
  // Note: we don't need to guard against
  // zero-length input for either string
  // here, since we've already done that
  char *ptr = strstr(s1, s2);
  return ptr == NULL ? 0 : 1;
}

int isRotation(char *s1, char *s2)
{
  int length = strlen(s1);

  char buffer[MAX_STRING_LENGTH * 2];
  char *doubledString = malloc(sizeof(buffer) + 1);

  strncpy(doubledString, s1, length);
  strncat(doubledString, s1, length);

  // Our lone call to isSubstring
  //
  // Note: this function treats the string as a rotation
  // of itself, e.g. "waterbottle" will return zero and
  // print "waterbottle is a rotation of waterbottle"
  if (isSubstring(doubledString, s2))
  {
    printf("%s is a rotation of %s.\n", s2, s1);
    return 0;
  }
  else
  {
    printf("%s is not a rotation of %s.\n", s2, s1);
    return 1;
  }
}
