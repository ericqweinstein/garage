/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Two:
 * 
 * For values of the Fibonacci sequence
 * below four million, find the sum of
 * the even-numbered values.
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>

int fibNext(int first, int second);

int main(void)
{
  int previous = 1;
  int current = 1;
  int sum = 0;

  while (sum < 4000000)
  {
    int next;
    next = fibNext(previous, current);

    if (next % 2 == 0)
    {
      sum += next;
    }
    previous = current;
    current = next;
  }
  printf("%d\n", sum);
  return sum;

  // Answer: 4613732

}

int fibNext(int first, int second)
{
  // Does not handle the first two entries
  return first + second;
}
