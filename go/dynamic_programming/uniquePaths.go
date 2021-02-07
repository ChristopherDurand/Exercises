package main

import (
	"fmt"
	"time"
)

func uniquePaths(r, c int) int {
	if r == 1 || c == 1 {
		return 1
	} else {
		return uniquePaths(r-1, c) + uniquePaths(r, c-1)
	}
}

func memoUniquePaths(r, c int, memo map[string]int) int {
	index := fmt.Sprintf("%v,%v", r, c)
	if val, exists := memo[index]; exists {
		return val
	} else {
		if r == 1 || c == 1 {
			memo[index] = 1
		} else {
			memo[index] = memoUniquePaths(r-1, c, memo) + memoUniquePaths(r, c-1, memo)
		}
		return memo[index]
	}
}

func betterUniquePaths(r, c int) int {
	memo := make(map[string]int)
	memo["1:1"] = 1
	return memoUniquePaths(r, c, memo)
}
func pathThunk(inner func(r, c int) int, name string, r, c int) func() {
	return func() {
		fmt.Printf("%v(%v, %v) = %v\n", name, r, c, inner(r, c))
	}
}

func timeit(thunk func(), name string) {
	start := time.Now()
	thunk()
	duration := time.Since(start)
	fmt.Printf("%v took %v\n", name, duration)
}

func main() {
	for i := 10; i < 15; i++ {
		thunk := pathThunk(uniquePaths, "uniquePaths", i, 20)
		timeit(thunk, "uniquePaths")
		timeit(pathThunk(betterUniquePaths, "betterUniquePaths", i, 20), "betterUniquePaths")
	}
}
