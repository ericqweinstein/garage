// 2.6: Given a circular linked list, implement an algorithm
// that returns the node at the beginning of the loop.
//
// EXAMPLE
//
// Input: A -> B -> C -> D -> E -> C
// Output: C

#include <stdio.h>
#include <stdlib.h>
#include "list.h"

List * createListWithLoop(void);
Node * getStartOfLoop(List *);

int main(void)
{
  List *list = createListWithLoop();
  Node *beginningOfLoop = getStartOfLoop(list);

  printf("%c\n", beginningOfLoop -> data);

  return 0;
}

// Because this list contains a loop, we'll build it by hand
List * createListWithLoop()
{
  Node *root  = NULL;
  Node *two   = NULL;
  Node *three = NULL;
  Node *four  = NULL;
  Node *five  = NULL;

  root  = malloc(sizeof(Node));
  two   = malloc(sizeof(Node));
  three = malloc(sizeof(Node));
  four  = malloc(sizeof(Node));
  five  = malloc(sizeof(Node));

  // The integers are the char codes for 'A', 'B', 'C', &c
  root -> data = 65;
  root -> next = two;

  two -> data = 66;
  two -> next = three;

  three -> data = 67;
  three -> next = four;

  four -> data = 68;
  four -> next = five;

  five -> data = 69;
  five -> next = three;

  List *list = NULL;
  list = malloc(sizeof(List));

  list -> size = 5;
  list -> head = root;

  return list;
}

Node * getStartOfLoop(List *list)
{
  // We'll detect the loop by sending two pointers through it:
  // a fast one and a slow one. The fast pointer will traverse
  // the list twice as quickly as the slow. If they equal each
  // other, we'll know there's a loop; since our pointers will
  // cross just past the loop, we'll use a third pointer to
  // keep track of the node that marks the start of the loop.
  //
  // TODO: Review the logic here/test with additional lists--
  // not yet convinced this works in the general case

  Node *oneBack = list -> head;
  Node *slow    = list -> head;
  Node *fast    = list -> head;

  while (slow && fast && fast -> next)
  {
    oneBack = slow;
    slow = slow -> next;
    fast = fast -> next -> next;

    // We don't need an else because we've stipulated that
    // the function will always be passed a circular list
    if (slow == fast)
    {
      return oneBack;
    }
  }
}
