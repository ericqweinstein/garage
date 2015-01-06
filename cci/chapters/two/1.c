// 2.1: Write code to remove duplicates from an unsorted linked list.

#include <stdio.h>
#include <stdlib.h>
#include "list.h"

// We're essentially implementing a set, only we're guaranteeing
// O(n) time complexity instead of the O(log(n)) that would be
// afforded by a binary tree as the underlying data structure
//
// This algorithm will actually be O(n^2); we could get O(nlog(n))
// if we were to sort the linked list via mergesort/quicksort then
// traverse the list, or O(n) if we were to implement a hash table

List * removeDuplicatesFromList(List *);

int main(void)
{
  List *list = createList(1);
  appendToList(2, list);
  appendToList(3, list);
  appendToList(2, list);
  displayList(list);
  removeDuplicatesFromList(list);
  displayList(list);

  return 0;
}

List * removeDuplicatesFromList(List *list)
{
  Node *ptr1, *ptr2, *tmp;
  ptr1 = list -> head;

  while (ptr1 != NULL && ptr1 -> next != NULL)
  {
    ptr2 = ptr1;
    while (ptr2 -> next != NULL)
    {
      if (ptr1 -> data == ptr2 -> next -> data)
      {
        tmp = ptr2 -> next;
        ptr2 -> next = ptr2 -> next -> next;
        tmp = NULL;
        free(tmp);
      }
      else
      {
        ptr2 = ptr2 -> next;
      }
    }
    ptr1 = ptr1 -> next;
  }

  ptr1 = NULL;
  ptr2 = NULL;
  free(ptr1);
  free(ptr2);

  return list;
}
