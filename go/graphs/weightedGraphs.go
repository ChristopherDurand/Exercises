package main

type weightedVertex struct {
	value       string
	adjacencies []*Weight
}
type Weight struct {
	weight int
	vertex *weightedVertex
}

func newWeight(vertex *weightedVertex, weight int) *Weight {
	return &Weight{weight, vertex}
}

func (this *weightedVertex) addAdjacency(vertex *weightedVertex, weight int) {
	this.adjacencies = append(this.adjacencies, newWeight(vertex, weight))
}

func main() {

}
