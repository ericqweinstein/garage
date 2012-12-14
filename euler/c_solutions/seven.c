/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Seven:
 *
 * What is the 10,001st prime number?
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>
#include <math.h>

int nthPrime(int);

int main(void)
{
  int result = nthPrime(10000);

  printf("%d\n", result);
  return result;

  // Answer: 104743

}

int nthPrime(int n)
{
  int candidate = 2;
  int nthPrime = 2;
  int counter = 0;
  while (counter <= n)
  {
    // If you divide a number by every integer
    // between two and its own square root
    // (inclusive) and never get a remainder
    // of zero, that number is prime
    int i;
    int upperLimit = sqrt(candidate);
    for (i = 2; i <= upperLimit; i++)
    {
      if (candidate % i == 0)
      {
        break;
      }
    }
    if (i > upperLimit)
    {
      nthPrime = candidate;
      counter++;
    }
    candidate++;
  }
  return nthPrime;
}
