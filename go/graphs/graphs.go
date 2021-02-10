package main

import "fmt"

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

	fmt.Println("Hello World!")
}
