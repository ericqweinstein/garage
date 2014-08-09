// 2.5: You have two numbers represented by a linked list, where each node
// contains a single digit. The digits are stored in _reverse_ order, such
// that the 1s digit is at the head of the list. Write a function that adds
// the two numbers and returns the sum as a linked list.
//
// EXAMPLE
//
// Input: (7 -> 1 -> 6) + (5 -> 9 -> 2) (i.e., 617 + 295)
// Output: 2 -> 1 -> 9 (i.e., 912)

#include <stdio.h>
#include <stdlib.h>
#include "list.h"

List * addLinkedListNumbers(List *, List *);

int main(void)
{
  // Being the unimaginative sort I am, I'll use the example values
  //
  // First, we'll create a list to represent 617
  List *a = createList(7);
  appendToList(1, a);
  appendToList(6, a);

  // Then a list to represent 295
  List *b = createList(5);
  appendToList(9, b);
  appendToList(2, b);

  // Finally, add them together
  List *sum = addLinkedListNumbers(a, b);
  displayList(sum);

  return 0;
}

List * addLinkedListNumbers(List *a, List *b)
{
  // We'll "reconstitute" our integers with a bit o' multiplication
  Node *nodeInA = a -> head;
  Node *nodeInB = b -> head;

  int valueA = 0, placeA = 1;
  int valueB = 0, placeB = 1;

  while (nodeInA != NULL)
  {
    valueA += (nodeInA -> data) * placeA;
    placeA *= 10;
    nodeInA = nodeInA -> next;
  }

  while (nodeInB != NULL)
  {
    valueB += (nodeInB -> data) * placeB;
    placeB *= 10;
    nodeInB = nodeInB -> next;
  }

  // Add 'em up
  int sum = valueA + valueB;

  // Determine the order of magnitude of our sum
  int placeC = 1;
  while (sum / placeC != 0)
  {
    placeC *= 10;
  }

  // Determine the least significant digit for list initialization
  List *sumList = createList(sum % 10);

  // For each order of magnitude in the sum, append the digit to
  // the list (we'll start with 10 ^ 2 since we already have 10 ^ 1)
  int i, j;
  for (i = 100, j = 10; i <= placeC; i *= 10, j *= 10)
  {
    appendToList((sum % i / j), sumList);
  }

  return sumList;
}
