/* * * * * * * * * * * * * * * * * * *
 * Project Euler Problem Number Five:
 *
 * What is the smallest number divisible
 * by each of the numbers one to twenty?
 * * * * * * * * * * * * * * * * * * */

#include <stdio.h>
// We could include the C99 <stdbool.h>,
// but let's add our own for kicks
typedef int bool;
#define true 1
#define false 0

int main(void)
{
  // Anything divisible by 12, 14, 15, 16, and 18 is also divisible
  // by 1 - 9; anything divisible by 20 is also divisible by 10;
  // the rest are prime. Since we need divisibility by 20, we can
  // jump by intervals of 20. "lcm" stands for Lowest Common Multiple.
  int lcm = 20;
  while (true) {
    lcm += 20;
    if ((lcm % 11 == 0) &&
       (lcm % 12 == 0) &&
       (lcm % 13 == 0) &&
       (lcm % 14 == 0) &&
       (lcm % 15 == 0) &&
       (lcm % 16 == 0) &&
       (lcm % 17 == 0) &&
       (lcm % 18 == 0) &&
       (lcm % 19 == 0))
    break;
  }
  printf("%d\n", lcm);
  return lcm;

  // Answer: 232792560

}
