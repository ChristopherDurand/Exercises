package main

import "fmt"

type node struct {
	data int
	next *node
}
type LinkedList struct {
	first *node
}

func NewLinkedList(a int) *LinkedList {
	return &LinkedList{&node{data: a, next: nil}}
}

func (caller *LinkedList) Read(n int) (data int) {
	current := caller.first
	if n == 0 {
		return caller.first.data
	}
	for i := 0; i < n; i++ {
		if current.next != nil {
			current = current.next
		} else {
			panic("Index out of bounds")
		}
	}
	return current.data
}

func (caller *LinkedList) IndexOf(value int) int {
	i := 0
	for current := caller.first; current != nil; current = current.next {
		if current.data == value {
			return i
		}
		i++
	}
	return -1
}

func (caller *node) String() string {
	result := fmt.Sprintf("%v", caller.data)
	if caller.next != nil {
		result += fmt.Sprintf(" %v", caller.next.String())
	}
	return result
}

func (caller *LinkedList) String() string {
	return fmt.Sprintf("[ %v ]", caller.first.String())
}

func (caller *LinkedList) deleteAtIndex(n int) {
	if n == 0 {
		caller.first = caller.first.next
		return
	}

	current := caller.first
	for i := 0; i < n-1; i++ {
		if current.next != nil {
			current = current.next
		} else {
			panic("Index out of range")
		}
	}
	current.next = current.next.next
}

func (caller *LinkedList) InsertAtIndex(n int, data int) {
	newNode := node{data, nil}
	if n == 0 {
		newNode.next = caller.first
		caller.first = &newNode
		return
	}

	// access the node just before where we want the new one to go
	current := caller.first
	for i := 0; i < n-1; i++ {
		if current.next != nil {
			current = current.next
		} else {
			panic("Index out of range")
		}
	}
	newNode.next = current.next
	current.next = &newNode
	return
}

func main() {
	list := NewLinkedList(3)
	list.InsertAtIndex(1, 2)
	list.InsertAtIndex(2, 5)

	fmt.Println(list.Read(0))
	fmt.Println(list.Read(1))
	fmt.Println(list.Read(2))

	fmt.Println(list.IndexOf(3))
	fmt.Println(list.IndexOf(2))
	fmt.Println(list.IndexOf(5))
	fmt.Println(list.IndexOf(1))

	list.InsertAtIndex(0, 23)
	fmt.Println(list.String())
	list.InsertAtIndex(4, 26)
	fmt.Println(list.String())
	list.deleteAtIndex(0)
	fmt.Println(list.String())
	list.deleteAtIndex(3)
	fmt.Println(list.String())
}
