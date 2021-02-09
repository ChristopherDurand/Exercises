package main

import "fmt"

type TreeNode struct {
	value int
	left  *TreeNode
	right *TreeNode
}

/*
 - To find a value in a BST:
 - If value to be found is equal to current node's value: good! return.
 - If value to be fonud is less than current node's value: Search left subtree.
	 - Set current to left node.
	 - Go to step 1.
 - If value to be found is greater than current node's value: search right subtree.
	 - Set current to right node.
	 - Goto step 1.
 - If there is no sub tree where we need there to be one: Value DNE.
*/

func (caller *TreeNode) exists(value int) bool {
	if value == caller.value {
		return true
	} else if value > caller.value && caller.right != nil {
		return caller.right.exists(value)
	} else if value < caller.value && caller.left != nil {
		return caller.left.exists(value)
	} else {
		return false
	}
}

func main() {
	fmt.Println("Hello World")

	// bad tree:
	//    5
	//  3   7
	// 2 4 6 8
	lolor := &TreeNode{2, nil, nil}
	rolor := &TreeNode{4, nil, nil}
	lor := &TreeNode{3, lolor, rolor}
	loror := &TreeNode{6, nil, nil}
	roror := &TreeNode{8, nil, nil}
	ror := &TreeNode{7, loror, roror}
	root := &TreeNode{5, lor, ror}

	fmt.Println(root.exists(2))
}
