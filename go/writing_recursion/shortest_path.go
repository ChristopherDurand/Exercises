package main

import "fmt"

// sub problem: path count of v-1, h + v, h-1
// base case: if v or h = 1, paths = 1
func shortestPath(v, h int) int {
	if v == 1 || h == 1 {
		return 1
	} else {
		return shortestPath(v-1, h) + shortestPath(v, h-1)
	}
}

func main() {
	fmt.Println(shortestPath(1, 1))   // 1
	fmt.Println(shortestPath(2, 2))   // 2
	fmt.Println(shortestPath(3, 3))   // 6
	fmt.Println(shortestPath(10, 10)) // big boi
}
