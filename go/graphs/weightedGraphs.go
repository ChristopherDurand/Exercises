package main

import "fmt"

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

func newWeightedVertex(value string) *weightedVertex {
	adj := make([]*Weight, 0)
	return &weightedVertex{value, adj}
}

func (this *weightedVertex) addAdjacency(vertex *weightedVertex, weight int) {
	this.adjacencies = append(this.adjacencies, newWeight(vertex, weight))
}

func (start *weightedVertex) shortestPath(target *weightedVertex) []*weightedVertex {
	cheapest := make(map[*weightedVertex]int)
	cheapest[start] = 0
	visited := make(map[*weightedVertex]bool)
	cheapestPrevious := make(map[*weightedVertex]*weightedVertex)
	unvisited := make([]*weightedVertex, 0)
	current := start
	for current != nil {
		visited[current] = true
		unvisited = remove(unvisited, current)
		for _, link := range current.adjacencies {
			neighbor := link.vertex
			cost := link.weight
			totalCost := cost
			if !visited[neighbor] {
				unvisited = append(unvisited, neighbor)
			}
			if subCost, exists := cheapest[current]; exists {
				totalCost += subCost
			}
			if neighborCost, exists := cheapest[neighbor]; !exists || totalCost < neighborCost {
				cheapest[neighbor] = totalCost
				cheapestPrevious[neighbor] = current
			}
		}
		if len(unvisited) > 0 {
			nextVertex := unvisited[0]
			var nextCost int
			for _, vertex := range unvisited {
				if price, exists := cheapest[vertex]; exists && price < nextCost {
					nextVertex = vertex
					nextCost = price
				}
			}
			current = nextVertex
		} else {
			current = nil
		}
	}

	current = target
	shortestPath := make([]*weightedVertex, 0)
	for current != start {
		shortestPath = append([]*weightedVertex{current}, shortestPath...)
		current = cheapestPrevious[current]
	}
	shortestPath = append([]*weightedVertex{start}, shortestPath...)
	return shortestPath
}

func remove(arr []*weightedVertex, val *weightedVertex) []*weightedVertex {
	indexToRemove := -1
	for index, vertex := range arr {
		if vertex == val {
			indexToRemove = index
			break
		}
	}
	if indexToRemove >= 0 {
		return append(arr[:indexToRemove], arr[indexToRemove+1:]...)
	} else {
		return arr
	}
}

func main() {
	Denver := newWeightedVertex("Denver")
	Chicago := newWeightedVertex("Chicago")
	ElPaso := newWeightedVertex("El Paso")
	Atlanta := newWeightedVertex("Atlanta")
	Boston := newWeightedVertex("Boston")
	Denver.addAdjacency(Chicago, 40)
	Denver.addAdjacency(ElPaso, 140)
	ElPaso.addAdjacency(Boston, 100)
	Chicago.addAdjacency(ElPaso, 80)
	Boston.addAdjacency(Chicago, 120)
	Boston.addAdjacency(Denver, 180)
	Atlanta.addAdjacency(Boston, 100)
	Atlanta.addAdjacency(Denver, 160)
	path := Atlanta.shortestPath(ElPaso)
	for _, vertex := range path {
		fmt.Println(vertex.value)
	}
}
