// 2.4: Write code to partition a linked list around a value x, such that
// all nodes less than x come before all nodes greater than or equal to x.

#include <stdio.h>
#include <stdlib.h>
#include "list.h"

List * partitionList(int, List *);

int main(void)
{
  List *list = createList(1);
  appendToList(2, list);
  appendToList(3, list);
  appendToList(4, list);
  appendToList(5, list);
  prependToList(0, list);
  displayList(list);
  // We'll arbitrarily partition around 3
  List *partitionedList = partitionList(3, list);
  displayList(partitionedList);

  return 0;
}

List * partitionList(int value, List *list)
{
  // Our function takes a value and a list, then traverses
  // that list. If it finds a value less than the partition
  // value, it prepends it to a new list; if the value is
  // greater, it appends it. (Values needn't increase mono-
  // tonically, they just have to be on the right side of x.)

  // This will recurse forever if we try to modify the list
  // in-place, so we'll create a new list into which we'll
  // copy the sorted values.

  // Initialize a new linked list with the value
  List *duplicate = createList(value);

  // Iterate over the original list, (ap|pre)pending as needed
  Node *node = list -> head;
  while (node != NULL)
  {
    if (node -> data < value)
    {
      prependToList(node -> data, duplicate);
    }
    else if (node -> data > value)
    {
      appendToList(node -> data, duplicate);
    }
    node = node -> next;
  }

  return duplicate;
}

