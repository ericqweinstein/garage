/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Seven:
 *
 * What is the 10,001st prime number?
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>
#include <math.h>

// Again, could use <stdbool.h>, gonna be fancy
typedef int bool;
#define true 1
#define false 0

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
    bool isPrime = true;
    int i;
    for (i = 2; i <= sqrt(candidate) && isPrime; i++)
    {
      if (candidate % i == 0)
      {
        isPrime = false;
      }
    }
    if (isPrime)
    {
      nthPrime = candidate;
      candidate++;
      counter++;
    }
    else
    {
      candidate++;
    }
  }
  return nthPrime;
}
