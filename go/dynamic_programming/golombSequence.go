package main

import (
	"fmt"
	"time"
)

func golomb(n int) int {
	if n == 1 {
		return 1
	} else {
		return 1 + golomb(n-golomb(golomb(n-1)))
	}
}

func memoGolomb(n int, memo map[int]int) int {
	if val, exists := memo[n]; exists {
		return val
	} else {
		memo[n] = 1 + memoGolomb(n-memoGolomb(memoGolomb(n-1, memo), memo), memo)
		return memo[n]
	}
}

func betterGolomb(n int) int {
	memo := make(map[int]int)
	memo[1] = 1
	return memoGolomb(n, memo)
}

func main() {
	for i := 1; i < 60; i++ {
		start := time.Now()
		fmt.Printf("golomb(%v) = %v\n", i, golomb(i))
		duration := time.Since(start)
		fmt.Printf("slow calc took %v\n", duration)
		start = time.Now()
		fmt.Printf("golomb(%v) = %v\n", i, betterGolomb(i))
		duration = time.Since(start)
		fmt.Printf("fast calc took %v\n", duration)
	}
}
