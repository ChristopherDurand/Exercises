package main

import "fmt"

type Node struct {
	data int
	next *Node
}
type LinkedList struct {
	first *Node
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

func (caller *LinkedList) indexOf(value int) int {
	for i, current := 0, caller.first; current != nil; i, current = i+1, current.next {
		if current.data == value {
			return i
		}
	}
	return -1
}

// func (caller *LinkedList) insertAtIndex(n int, data int) int {
// 	newNode = Node{data, nil}
// 	if n == 0 {

// 	}
// }

func main() {
	a := Node{5, nil}
	b := Node{2, &a}
	c := Node{3, &b}
	list := LinkedList{&c}
	fmt.Println(list.Read(0))
	fmt.Println(list.Read(1))
	fmt.Println(list.Read(2))

	fmt.Println(list.indexOf(3))
	fmt.Println(list.indexOf(2))
	fmt.Println(list.indexOf(5))
	fmt.Println(list.indexOf(1))

}
