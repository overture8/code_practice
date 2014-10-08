package main

import "fmt"

type Node struct {
	data int
	next *Node
}

var head *Node

func Insert(x int) {
	node := new(Node)
	node.data = x
	node.next = head
	head = node
}

func Reverse(node *Node) {
	if node.next == nil {
		head = node
		return
	}

	Reverse(node.next)

	node.next.next = node
	node.next = nil
}

func Print() {
	var node *Node = head
	fmt.Println("List is: ")
	for node != nil {
		fmt.Println(node.data)
		node = node.next
	}
	fmt.Println("\n")
}

func main() {
	head = nil
	var n, x int

	fmt.Println("How many numbers?")
	fmt.Scan(&n)

	i := 0
	for i < n {
		fmt.Println("Enter the number")
		fmt.Scan(&x)
		Insert(x)
		Print()
		i++
	}

	Reverse(head)
	Print()
}
