package main

import "fmt"

// total characters of array of length N
// is the total characters of array of [1,N] plus characters in 0
func totalCharacters(words []string) int {
	if len(words) == 0 {
		return 0
	}
	return len(words[0]) + totalCharacters(words[1:])
}

func main() {
	words := []string{"abc", "", "abebc", "abracadabra"}
	fmt.Println(totalCharacters(words))      // should be 19
	fmt.Println(totalCharacters([]string{})) // should be zero
}
