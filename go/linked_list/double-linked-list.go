package main

type doubleNode {
	data int
	previous int
	next int
}

type DoubleLinkedList {
	first *doubleNode
	last *doubleNode
}
func newDoubleNode(data int, previous, next *doubleNode) *doubleNode {
	return doubleNode{data, previous, next}
}
func main() {

}