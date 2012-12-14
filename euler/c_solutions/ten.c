/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Ten:
 *
 * Find the sum of all prime
 * numbers below two million.
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <stdbool.h>

uint64_t sumPrimes(int);
bool isPrime(int);

uint64_t main(void)
{
  // This is gonna be a big one,
  // we're gonna need 64 bits
  uint64_t result = 0;
  result = sumPrimes(2000000);

  printf("%llu\n", result);
  return result;

  // Answer: 142913828922

}

uint64_t sumPrimes(int limit)
{
  uint64_t sum = 0;
  int i = 0;
  for (i = 2; i <= limit; i++)
  {
    if (isPrime(i))
    {
      sum += i;
    }
  }
  return sum;
}

bool isPrime(int n)
{
  int i = 0;
  bool isPrime = true;
  int upperLimit = sqrt(n);
  for (i = 2; i <= upperLimit && isPrime; i++)
  {
    if (n % i == 0)
    {
      isPrime = false;
      break;
    }
  }

  return isPrime;
}
