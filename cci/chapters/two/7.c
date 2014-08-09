// 2.7: Implement a function to check if a linked list is a palindrome.

#include <stdio.h>
#include <stdlib.h>
#include "list.h"

int isListPalindrome(List *);

int main(void)
{
  // Create a list that is a palindrome
  List *palindromeList = createList(1);
  appendToList(2, palindromeList);
  appendToList(3, palindromeList);
  appendToList(2, palindromeList);
  appendToList(1, palindromeList);

  // Create a list that is _not_ a palindrome
  List *normalList = createList(1);
  appendToList(2, normalList);
  appendToList(3, normalList);

  displayList(palindromeList);
  isListPalindrome(palindromeList);
  displayList(normalList);
  isListPalindrome(normalList);

  return 0;
}

// I assume the question means a singly linked list, which is trickier,
// so we'll do that. Basically, we'll iterate over the list, pushing
// each value we encounter to an array. We can then reverse the array
// and iterate again, comparing the two element-by-element, returning
// early if we don't match. If we hit the end without missing a match,
// we've got a palindrome.
int isListPalindrome(List *list)
{
  int arrayLength = list -> size;
  int array[arrayLength];
  int reversedArray[arrayLength];

  Node *node = list -> head;

  int i, j, k;
  for (i = 0, j = arrayLength - 1; i < arrayLength; i++, j--)
  {
    array[i] = node -> data;
    reversedArray[j] = array[i];
    node = node -> next;
  }

  // Compare the two arrays element by element
  for (k = 0; k < arrayLength; k++)
  {
    if (array[k] != reversedArray[k])
    {
      printf("This list is not a palindrome.\n");
      return 1;
    }
  }
  printf("This list is a palindrome.\n");
  return 0;
}
