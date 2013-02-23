/* * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Six:
 *
 * What is the difference between the
 * sum of the squares and the square
 * of the sums for the numbers 1 - 100?
 * * * * * * * * * * * * * * * * * */

#include <stdio.h>

int squareOfSum(int);
int sumOfSquares(int);

int main(void)
{
  int result = squareOfSum(100) - sumOfSquares(100);
  printf("%d\n", result);
  return result;

  // Answer: 25164150

}

int squareOfSum(int limit)
{
  int i;
  int current = 0;
  for (i = 0; i <= limit; i++)
  {
    current += i;
  }
  return (current * current);
}

int sumOfSquares(int limit)
{
  int i;
  int current = 0;
  for (i = 0; i <= limit; i++)
  {
    current += (i * i);
  }
  return current;
}

