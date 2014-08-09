// 2.3: Implement an algorithm to delete a node in the middle
// of a singly linked list, given only access to that node.

#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
  int data;
  struct node *next;
} Node;

void deleteNode(Node *);
Node * createTestList(void);
Node * appendToList(int, Node *);
void displayList(Node *);

// A global isn't the best solution here, but we'll refactor later
Node *nodeToDelete;

int main(void)
{
  Node *root = createTestList();
  displayList(root);
  // Delete the third node in the list
  // (see createTestList(), below)
  deleteNode(nodeToDelete);
  displayList(root);

  return 0;
}

// We can't traverse the list since this requires knowledge
// of the head node. What we'll do instead is given the address
// of a node N that we want to delete, copy the data in N + 1
// to N, then delete N + 1.
void deleteNode(Node *n)
{
  nodeToDelete = n -> next;
  n -> data = nodeToDelete -> data;
  n -> next = nodeToDelete -> next;
  nodeToDelete = NULL;
  free(nodeToDelete);
}

Node* createTestList()
{
  Node *root = NULL;
  root = malloc(sizeof(Node));

  root -> data = 1;
  root -> next = NULL;

  appendToList(2, root);
  // Set the value of the node to be deleted
  nodeToDelete = appendToList(3, root);
  appendToList(4, root);

  return root;
}

Node* appendToList(int value, Node *currentNode)
{
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
