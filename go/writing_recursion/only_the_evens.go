package main

import "fmt"

// Sub problem: only the evens of [1:]
// return [N, ...[1:]] if N is even, or [...[1:]] if N is odd
func onlyTheEvens(numbers []int) []int {
	if len(numbers) == 0 {
		return numbers
	}
	if numbers[0]%2 == 0 {
		return append(numbers[:1], onlyTheEvens(numbers[1:])...)
	} else {
		return onlyTheEvens(numbers[1:])
	}
}

func main() {
	nums := []int{30, 20, 10, 5, 6, 7, 8, 9, 10}
	fmt.Println(onlyTheEvens(nums)) // [30 20 10 6 8 10]
}
