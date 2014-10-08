#include <stdlib.h>
#include <stdio.h>

struct Node {
  int data;
  struct Node* next;
};

struct Node* head;

void Insert(int x) {
  struct Node* newNode = malloc(sizeof(struct Node));
  newNode->data = x;
  newNode->next = head;
  head = newNode;
}

void Reverse(struct Node* node) {
  if (node->next == NULL) {
    head = node;
    return;
  }

  Reverse(node->next);

  struct Node* nodeNext = node->next;
  node->next->next = node;
  node->next = NULL;
}

void Print() {
  struct Node* firstNode = head;
  printf("List is: ");
  while (firstNode != NULL) {
    printf(" %d ", firstNode->data);
    firstNode = firstNode->next;
  }
  printf("\n");
}

int main() {
  head = NULL;
  printf("How many numbers?\n");
  int n, i, x;
  scanf("%d", &n);
  for (i = 0; i < n; i++) {
    printf("Enter the number\n");
    scanf("%d", &x);
    Insert(x);
    Print();
  }

  Reverse(head);
  Print();
}
