package main

import "fmt"

type Heap struct {
	data []int
}

// A heap is a binary tree with two conditions:
//	 the value of each node must be greater than each of its descendants.
//		 "heap condition"
// 	the tree must be complete.
//    this means that there are no empty nodes on the tree, except for:
//      the bottom row can have missing nodes, but they must all be on the right.

/*
	Heap Insertion
	1. Create a new node.
	2. Place it in the next available spot in the bottom row.
	  a. Sub problem: Find the "Last Node"
	3. Compare with its parent: is it greater? If so, swap.
	4. Recurse step 3 until the condition is false.
*/
func (this *Heap) insert(val int) {
	this.data = append(this.data, val)
	this.trickleUp(len(this.data) - 1)
}
func (this *Heap) trickleUp(index int) {
	parent := (index - 1) / 2
	if parent >= 0 && this.data[index] > this.data[parent] {
		this.data[index], this.data[parent] = this.data[parent], this.data[index]
		this.trickleUp(parent)
	}
}

/*
	Heap Deletion
	Only ever delete the root node.
	1. Move the "Last Node" into the root position.
	2. "Trickle down" the root into it's proper position.
*/
func (this *Heap) hasGreaterChild(index int) bool {
	leftChild := index*2 + 1
	rightChild := index*2 + 2
	if leftChild < len(this.data) && this.data[leftChild] > this.data[index] {
		return true
	}
	if rightChild < len(this.data) && this.data[rightChild] > this.data[index] {
		return true
	}
	return false
}

func (this *Heap) calculateGreaterChild(index int) int {
	leftChild := index*2 + 1
	rightChild := index*2 + 2
	if rightChild < len(this.data) {
		left := this.data[leftChild]
		right := this.data[rightChild]
		if left > right {
			return leftChild
		} else {
			return rightChild
		}
	} else {
		return leftChild
	}
}

func (this *Heap) delete() {
	this.data[len(this.data)-1], this.data[0] = this.data[0], this.data[len(this.data)-1]
	this.data = this.data[:(len(this.data) - 1)]

	trickleIndex := 0
	for this.hasGreaterChild(trickleIndex) {
		gci := this.calculateGreaterChild(trickleIndex)
		this.data[trickleIndex], this.data[gci] = this.data[gci], this.data[trickleIndex]
		trickleIndex = gci
	}
}

/*
	Trickle Down
	if trickle node is less than its children,
	swap with the greater of the two.
	Then trickle again.
*/

/*
	Navigating an array-heap:
	To get to its left child,   I * 2  + 1
	To get to its right child,  I * 2  + 2
	To get to its parent,      (I - 1) / 2
*/
func main() {
	fmt.Println("Hello World")
	heap := Heap{[]int{}}
	heap.insert(5)
	fmt.Println(heap.data)
	heap.insert(6)
	fmt.Println(heap.data)
	heap.insert(7)
	fmt.Println(heap.data)
	heap.insert(8)
	fmt.Println(heap.data)
	heap.insert(12)
	fmt.Println(heap.data)
	heap.delete()
	fmt.Println(heap.data)
	heap.delete()
	fmt.Println(heap.data)
	heap.delete()
	fmt.Println(heap.data)
	heap.delete()
	fmt.Println(heap.data)
	heap.delete()
	fmt.Println(heap.data)
}

//
//        11
//     10     8
//   6   9   7 4
//  2 1 3 5
//

//
//        9
//     6     8
//   3   5 7   4
//  2 1

// 99, 68, 55, 34, 10, 2
