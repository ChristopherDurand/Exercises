package main

import (
	"fmt"
	"time"
)

// Rewrite this to remove unecesary recursive calls
func addUntil100(numbers []int) int {
	if len(numbers) == 0 {
		return 0
	}
	if numbers[0]+addUntil100(numbers[1:]) > 100 {
		return addUntil100(numbers[1:])
	} else {
		return numbers[0] + addUntil100(numbers[1:])
	}
}

func betterAddUntil100(numbers []int) int {
	if len(numbers) == 0 {
		return 0
	}
	subSum := betterAddUntil100(numbers[1:])
	if numbers[0]+subSum > 100 {
		return subSum
	} else {
		return numbers[0] + subSum
	}
}

func main() {
	numbers := []int{
		10, 20, 30, 40, 50, 10, 20,
		30, 40, 50, 10, 20, 30, 40,
		50, 10, 20, 30, 40, 50, 60,
		70, 80, 10, 20, 30, 40, 20, 30}
	start := time.Now()
	addUntil100(numbers)
	duration := time.Since(start)
	fmt.Printf("Original function took %v\n", duration)
	start = time.Now()
	betterAddUntil100(numbers)
	duration = time.Since(start)
	fmt.Printf("improved function took %v\n", duration)
}
