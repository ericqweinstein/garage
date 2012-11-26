/* * * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number One:
 * 
 * Add all the natural numbers below 1000
 * that are multiples of three or five.
 * * * * * * * * * * * * * * * * * * * */

#include <stdio.h>

int main(void)
{
  // Keep track of our running total
  int runningTotal = 0;
  // Loop through numbers 1 to 1000, adding
  // multiples of 3 or 5 to runningTotal
  int i = 0;
  for (i = 0; i < 1000; i++)
  {
    if (i % 3 == 0)
    {
      runningTotal += i;
    }
    else if (i % 5 == 0)
    {
      runningTotal += i;
    }
  } 
  printf("%d\n", runningTotal);
  return 0;
}
