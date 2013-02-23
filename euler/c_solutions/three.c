/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Three:
 * 
 * What is the largest prime factor of
 * the number 600851475143?
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>
#include <stdint.h>

int main(void)
{
  // This number is > 4.3 billion,
  // so we'll need 64 bits
  uint64_t n = 600851475143;
  int factor = 2;

  while (n > 1)
  {
    // Increase the factor by 1 until we find a multiple; in
    // that case, divide n by that factor and decrement the
    // factor (kudos to bitRAKE for inspiring this optimization)
    if ((n % factor) == 0)
    {
      n /= factor;
      factor--;
    }
    factor++;
  }
  // Once our number gets down to 1,
  // we'll have our largest prime factor
  printf("%d", factor);
  return factor;

  // Answer: 6857

}

