package main

import "fmt"

type TrieNode struct {
	children map[rune]*TrieNode
}

func newTrieNode() *TrieNode {
	return &TrieNode{make(map[rune]*TrieNode)}
}

type Trie struct {
	root *TrieNode
}

func newTrie() *Trie {
	return &Trie{newTrieNode()}
}

/*
	Trie Insertion
	From the root as current node:
		Iterate over the string.
			if current node has the character as a key.
				Go to that node and continue the loop.
			otherwise,
				make that node and continue the loop.
		When we reach the end of the string,
			insert a *.
*/
func (this *Trie) insert(word string) {
	currentNode := this.root
	for _, char := range word {
		if childNode, exists := currentNode.children[char]; exists {
			currentNode = childNode
		} else {
			newNode := newTrieNode()
			currentNode.children[char] = newNode
			currentNode = newNode
		}
	}
	currentNode.children['*'] = nil
}

func (this *TrieNode) allWords(word string, words *[]string) {
	for char, childNode := range this.children {
		if char == '*' {
			*words = append(*words, word)
		} else {
			newWord := word + string(char)
			childNode.allWords(newWord, words)
		}
	}
	return
}

func (this *Trie) allWords() (result []string) {
	this.root.allWords("", &result)
	return
}

/*
	starting at the root, iterate over each character of the string.
	Look to see if CurrentNode has a child with that character as a key.
		If yes, return nil.
		If it does, update currentNode. Back to iteration.
		If we get to the end of our string, and there's a *, we found our string.
*/
func (this *Trie) search(word string) *TrieNode {
	currentNode := this.root
	for _, char := range word {
		if childNode, exists := currentNode.children[char]; exists {
			currentNode = childNode
		} else {
			return nil
		}
	}
	return currentNode
}

func (this *Trie) autoComplete(prefix string) []string {
	words := make([]string, 0)
	currentNode := this.search(prefix)
	if currentNode != nil {
		currentNode.allWords(prefix, &words)
	}
	return words
}

func main() {
	fmt.Println("Hello World!")
	words := newTrie()
	words.insert("cation")
	words.insert("caution")
	words.insert("caption")
	words.insert("captain")
	fmt.Println(words.allWords())
	fmt.Println(words.autoComplete("ca"))
}
