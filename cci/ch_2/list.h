#ifndef LIST_H
#define LIST_H

// This is a little fancier than what we've been doing, so we'll
// use a "smarter" linked list that keeps track of the root node
typedef struct node
{
  int         data;
  struct node *next;
} Node;

typedef struct list
{
  int  size;
  Node *head;
} List;

List * createList(int value)
{
  Node *root = NULL;
  root = malloc(sizeof(Node));

  root -> data = value;
  root -> next = NULL;

  List *list = NULL;
  list = malloc(sizeof(List));

  list -> size = 0;
  list -> head = root;

  return list;
}

Node * appendToList(int value, List *list)
{
  Node *currentNode = list -> head;

  // Traverse to the end of the list
  while (currentNode -> next != NULL)
  {
    currentNode = currentNode -> next;
  }

  Node *newNode = (Node *) malloc(sizeof(Node));
  newNode -> data = value;
  newNode -> next = NULL;

  currentNode -> next = newNode;

  list -> size++;

  return newNode;
}

Node * prependToList(int value, List *list)
{
  // Given the current root, create and set a new one
  Node *newRoot = NULL;
  newRoot = malloc(sizeof(Node));

  newRoot -> data = value;
  newRoot -> next = list -> head;

  list -> head = newRoot;

  list -> size++;

  return newRoot;
}

void deleteNode(int value, List *list)
{
  Node *previousNode = list -> head;
  Node *currentNode  = previousNode -> next;

  while(previousNode -> data != value && currentNode -> data != value)
  {
    previousNode = previousNode -> next;
    currentNode  = currentNode -> next;
  }

  // If the node to be deleted is the head node
  if (previousNode -> data == value)
  {
    list -> head = list -> head -> next;
  }
  else
  {
    previousNode -> next = previousNode -> next -> next;
  }

  list -> size--;

  previousNode = NULL;
  currentNode  = NULL;
  free(previousNode);
  free(currentNode);
}

void displayList(List *list)
{
  Node *node = list -> head;
  while (node != NULL)
  {
    printf("%d ", node -> data);
    node = node -> next;
  }
  printf("\n");
}

#endif

