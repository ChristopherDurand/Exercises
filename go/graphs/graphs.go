package main

import (
	"fmt"
)

type doubleNode struct {
	data     *Vertex
	previous *doubleNode
	next     *doubleNode
}

type DoubleLinkedList struct {
	first *doubleNode
	last  *doubleNode
}

func (caller *DoubleLinkedList) isEmpty() bool {
	return caller.first == nil
}

func (caller *DoubleLinkedList) InsertAtEnd(data *Vertex) {
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

func (caller *DoubleLinkedList) removeAtFront() *Vertex {
	removed := caller.first
	caller.first = caller.first.next
	return removed.data
}

type Queue struct {
	data *DoubleLinkedList
}

func (caller *Queue) isEmpty() bool {
	return caller.data.isEmpty()
}

func (caller *Queue) enqueue(data *Vertex) *Vertex {
	if caller.data == nil {
		caller.data = new(DoubleLinkedList)
	}
	caller.data.InsertAtEnd(data)
	return data
}

func (caller *Queue) dequeue() *Vertex {
	return caller.data.removeAtFront()
}

func (caller *Queue) read() *Vertex {
	return caller.data.first.data
}

type Vertex struct {
	value       string
	adjacencies []*Vertex
}

func newVertex(value string) *Vertex {
	return &Vertex{value, make([]*Vertex, 0)}
}

func (this *Vertex) addAdjacencies(verticies ...*Vertex) {
	this.adjacencies = append(this.adjacencies, verticies...)
}

func (this *Vertex) depthFirstDo(cb func(string)) {
	visited := make(map[string]bool)
	this.depthFirstRecurse(visited, cb)
}

func (this *Vertex) depthFirstRecurse(visited map[string]bool, cb func(string)) {
	visited[this.value] = true
	cb(this.value)
	for _, neighbor := range this.adjacencies {
		if _, exists := visited[neighbor.value]; exists {
			continue
		} else {
			neighbor.depthFirstRecurse(visited, cb)
		}
	}
}

func (this *Vertex) breadthFirstDo(cb func(string)) {
	visited := make(map[string]bool)
	queue := new(Queue)
	visited[this.value] = true
	queue.enqueue(this)

	for !queue.isEmpty() {
		current := queue.dequeue()
		cb(current.value)
		for _, neighbor := range current.adjacencies {
			if visited[neighbor.value] {
				continue
			} else {
				visited[neighbor.value] = true
				queue.enqueue(neighbor)
			}
		}
	}
}

func main() {
	Alice := newVertex("Alice")
	Bob := newVertex("Bob")
	Fred := newVertex("Fred")
	Helen := newVertex("Helen")
	Candy := newVertex("Candy")
	Derek := newVertex("Derek")
	Elaine := newVertex("Elaine")
	Gina := newVertex("Gina")
	Irena := newVertex("Irena")
	Alice.addAdjacencies(Bob, Candy, Derek, Elaine)
	Bob.addAdjacencies(Fred, Alice)
	Fred.addAdjacencies(Bob, Helen)
	Helen.addAdjacencies(Fred, Candy)
	Candy.addAdjacencies(Helen, Alice)
	Derek.addAdjacencies(Alice, Elaine, Gina)
	Elaine.addAdjacencies(Alice, Derek)
	Gina.addAdjacencies(Derek, Irena)
	Irena.addAdjacencies(Gina)

	Alice.depthFirstDo(func(val string) {
		fmt.Println(val)
	})
	fmt.Print("\n\n")
	Alice.breadthFirstDo(func(val string) {
		fmt.Println(val)
	})

	fmt.Println("Hello World!")
}
