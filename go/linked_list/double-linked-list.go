package main

import (
	"fmt"
	"strconv"
)

type doubleNode struct {
	data     int
	previous *doubleNode
	next     *doubleNode
}

type DoubleLinkedList struct {
	first *doubleNode
	last  *doubleNode
}

func (caller *doubleNode) String() (result string) {
	result = strconv.Itoa(caller.data)
	if caller.next != nil {
		result += " " + caller.next.String()
	}
	return result
}

func (caller *DoubleLinkedList) String() string {
	return fmt.Sprintf("[ %s ]", caller.first.String())
}

func (caller *DoubleLinkedList) InsertAtEnd(data int) {
	newNode := new(doubleNode)
	newNode.data = data
	if caller.first == nil {
		caller.first = newNode
		caller.last = newNode
	} else {
		newNode.previous = caller.last
		caller.last.next = newNode
		caller.last = newNode
	}
}

func (caller *DoubleLinkedList) removeAtFront() int {
	removed := caller.first
	caller.first = caller.first.next
	return removed.data
}

type Queue struct {
	data *DoubleLinkedList
}

func (caller *Queue) enqueue(data int) {
	if caller.data == nil {
		caller.data = new(DoubleLinkedList)
	}
	caller.data.InsertAtEnd(data)
}

func (caller *Queue) dequeue() int {
	return caller.data.removeAtFront()
}

func (caller *Queue) read() int {
	return caller.data.first.data
}

func main() {
	list := new(DoubleLinkedList)
	list.InsertAtEnd(1)
	list.InsertAtEnd(2)
	list.InsertAtEnd(3)
	list.InsertAtEnd(4)
	list.InsertAtEnd(5)
	fmt.Println(list.String())
	queue := new(Queue)
	queue.enqueue(5)
	queue.enqueue(3)
	queue.enqueue(2)
	fmt.Println(queue.dequeue())
	fmt.Println(queue.dequeue())
	fmt.Println(queue.dequeue())

}
