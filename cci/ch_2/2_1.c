// 2.1: Write code to remove duplicates from an unsorted linked list.

#include <stdio.h>
#include <stdlib.h>

// We're essentially implementing a set, only we're guaranteeing
// O(n) time complexity instead of the O(log(n)) that would be
// afforded by a binary tree as the underlying data structure
//
// This algorithm will actually be O(n^2); we could get O(nlog(n))
// if we were to sort the linked list via mergesort/quicksort then
// traverse the list, or O(n) if we were to implement a hash table

typedef struct node
{
  // The data type wasn't specified, so we'll use ints
  int data;
  struct node *next;
} Node;

Node* removeDuplicatesFromList(Node*);
Node* createTestList(void);
Node* appendToList(int, Node*);
void displayList(Node*);

int main(void)
{
  Node *root = createTestList();
  displayList(root);
  removeDuplicatesFromList(root);
  displayList(root);

  return 0;
}

Node* removeDuplicatesFromList(Node *root)
{
  Node *ptr1, *ptr2, *tmp;

  ptr1 = root;

  while(ptr1 != NULL && ptr1 -> next != NULL)
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

  return root;
}

Node* createTestList()
{
  Node *root = NULL;
  root = malloc(sizeof(Node));

  root -> data = 1;
  root -> next = NULL;

  appendToList(2, root);
  appendToList(3, root);
  appendToList(2, root);

  return root;
}

Node* appendToList(int value, Node *currentNode)
{
  // Traverse to the end of the list
  while (currentNode -> next != NULL)
  {
    currentNode = currentNode -> next;
  }

  Node *newNode = (Node *) malloc(sizeof(Node));
  newNode -> data = value;
  newNode -> next = NULL;

  currentNode -> next = newNode;

  return newNode;
}

void displayList(Node *node)
{
  while(node != NULL)
  {
    printf("%d ", node -> data);
    node = node -> next;
  }
  printf("\n");
}

