// 2.2: Implement an algorithm to find the
// kth-to-last element of a singly linked list.

#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
  int data;
  struct node *next;
} Node;

int countNodesInList(Node *);
void displayKthToLastElement(int, Node *);

Node * createTestList(void);
Node * appendToList(int, Node *);
void displayList(Node *);

int main(void)
{
  Node *root = createTestList();
  displayList(root);

  int count = countNodesInList(root);

  // Since we're not allowing for a user-
  // generated list, we won't allow for
  // user-generated values for k, either
  int k;
  for (k = 1; k <= count; k++)
  {
    displayKthToLastElement(k, root);
  }

  root = NULL;
  free(root);
  return 0;
}

int countNodesInList(Node *node)
{
  int count = 0;
  while (node != NULL)
  {
    count++;
    node = node -> next;
  }

  return count;
}

Node* createTestList()
{
  Node *root = NULL;
  root = malloc(sizeof(Node));

  root -> data = 1;
  root -> next = NULL;

  appendToList(2, root);
  appendToList(3, root);
  appendToList(4, root);
  appendToList(5, root);

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
  while (node != NULL)
  {
    printf("%d ", node -> data);
    node = node -> next;
  }
  printf("\n");
}

void displayKthToLastElement(int k, Node *node)
{
  // (For our purposes, "1th to last" == "last")
  int kthToLast = countNodesInList(node) - k;

  int i;
  for (i = 0; i < kthToLast; i++)
  {
    node = node -> next;
  }

  printf("For k = %d, kth to last element is %d.\n", k, node -> data);
}
