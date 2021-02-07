package main

import "fmt"

// sub problem: index of x is 1 + index of x in sub string [1:]

func findX(s string) int {
	if s[0] == 'x' {
		return 0
	} else {
		return 1 + findX(s[1:])
	}
}

func main() {
	fmt.Println(findX("abcdefghijklmnopqrstuvwxyz")) // 23
}
