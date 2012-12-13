/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Nine:
 *
 * Find the product of the Pythagorean
 * triple elements whose sum is 1,000.
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>

int findTriple(int);

int main(void)
{
  int tripleProduct = 0;
  tripleProduct = findTriple(1000);

  printf("%d\n", tripleProduct);
  return tripleProduct;

  // Answer: 31875000

}

int findTriple(int sum)
{
  int result = -1;
  int n;
  for (n = 0; n < sum; n++)
  {
    int m;
    for (m = 0; m < sum; m++)
    {
      // Thank you, Wikipedia:
      // http://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples

      int a = n * n - m * m;
      int b = 2 * m * n;
      int c = n * n + m * m;
      if (a + b + c == sum)
      {
        result = a * b * c;
      }
    }
  }
  return result;
}
