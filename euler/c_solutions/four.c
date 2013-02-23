/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Four:
 *
 * Find the largest palindrome made
 * from the product of two three-
 * digit numbers.
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int isPalindrome(int);

int main(void)
{
  int largestPalindrome = 0;

  // Three digit numbers only run from 100 to 999, so
  // we'll limit the ranges of our loops to those numbers
  int i;
  for (i = 100; i < 999; i++)
  {
    int j;
    for (j = 100; j < 999; j++)
    {
      int current = i * j;
      if ((isPalindrome(current) == 0) && largestPalindrome < current)
      {
        largestPalindrome = current;
      }
    }
  }
  printf("%d\n", largestPalindrome);
  return largestPalindrome;

  // Answer: 906609

}

int isPalindrome(int n)
{
  // The largest possible product of two three-digit numbers
  // is 998001, so we need seven characters (including \0)
  char str[7];
  sprintf(str, "%d", n);

  int length = strlen(str);
  char *rev = malloc(sizeof(char) * length);

  int i, j;
  for (i = 0, j = length - 1; i < length; i++, j--)
  {
    rev[i] = str[j];
  }
  int resultOfComparison = -2;
  resultOfComparison = strcmp(str, rev);

  // Free what you malloc
  free(rev);
  rev = NULL;

  return resultOfComparison;
  // Will be 0 for palindromes
}

