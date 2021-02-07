package main

import "fmt"

func triangular(n int) int {
	if n == 1 {
		return 1
	}
	return triangular(n-1) + n
}

func main() {
	fmt.Println(triangular(9)) // 45
	fmt.Println(triangular(7)) // 28

}
