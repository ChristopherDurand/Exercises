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

func (caller *TreeNode) find(value int) *TreeNode {
	if value == caller.value {
		return caller
	} else if value > caller.value && caller.right != nil {
		return caller.right.find(value)
	} else if value < caller.value && caller.left != nil {
		return caller.left.find(value)
	} else {
		return nil
	}
}

func (caller *TreeNode) exists(value int) bool {
	return caller.find(value) != nil
}

/*
	Successor node:
		The node with the least of all values greater than the node.

	Deleting rules:
		If the node has no children, simply delete it.
		If the node has exactly one child,
			delete the node and move the child into the deleted node's spot.
		when the node has two children,
			replace the node with the successor node*.
			If the successor has a right child,
			replace the successor with that child first.
*/

func (caller *TreeNode) delete(value int) *TreeNode {
	if caller == nil {
		return nil
	} else if value < caller.value {
		caller.left = caller.left.delete(value)
	} else if value > caller.value {
		caller.right = caller.right.delete(value)
	} else {
		if caller.left == nil {
			return caller.right
		} else if caller.right == nil {
			return caller.left
		} else {
			caller.right = caller.right.lift(caller)
		}
	}
	return caller
}

func (caller *TreeNode) lift(nodeToDelete *TreeNode) *TreeNode {
	if caller.left != nil {
		caller.left = caller.left.lift(nodeToDelete)
		return caller
	} else {
		nodeToDelete.value = caller.value
		return caller.right
	}
}

func (caller *TreeNode) traverse(callback func(int)) {
	if caller == nil {
		return
	} else {
		caller.left.traverse(callback)
		callback(caller.value)
		caller.right.traverse(callback)
	}
}
func (caller *TreeNode) traversePreorder(callback func(int)) {
	if caller == nil {
		return
	} else {
		callback(caller.value)
		caller.left.traversePreorder(callback)
		caller.right.traversePreorder(callback)
	}
}
func (caller *TreeNode) traversePostorder(callback func(int)) {
	if caller == nil {
		return
	} else {
		caller.left.traversePostorder(callback)
		caller.right.traversePostorder(callback)
		callback(caller.value)
	}
}

func (caller *TreeNode) insert(value int) {
	if value < caller.value {
		if caller.left != nil {
			caller.left = new(TreeNode)
		}
		caller.left.insert(value)
	} else {
		if caller.right != nil {
			caller.right = new(TreeNode)
		}
		caller.right.insert(value)
	}
}

func (caller *TreeNode) greatest() int {
	if caller.right != nil {
		return caller.right.greatest()
	} else {
		return caller.value
	}
}

func main() {
	fmt.Println("Hello World")

	// our tree:
	//    5
	//  3   7
	// 2 4 6 8
	//
	lolor := &TreeNode{2, nil, nil}
	rolor := &TreeNode{4, nil, nil}
	lor := &TreeNode{3, lolor, rolor}
	loror := &TreeNode{6, nil, nil}
	roror := &TreeNode{8, nil, nil}
	ror := &TreeNode{7, loror, roror}
	root := &TreeNode{5, lor, ror}

	fmt.Println(root.exists(2))
	if false {
		root.delete(5)
		fmt.Printf("   %v\n", root.value)
		fmt.Printf(" %v   %v\n", root.left.value, root.right.value)
		fmt.Printf("%v %v   %v\n", root.left.left.value, root.left.right.value, root.right.right.value)
	}
	root.traverse(func(arg int) {
		fmt.Printf("%v, ", arg)
	})
	fmt.Println()
	fmt.Println(root.greatest())
	// Imagined you inserted the following numbers in this order into an empty bst.
	// 1 5 9 2 4 10 6 3 8
	// what does the tree look like?
	//       1
	//			    5
	//       2     9
	//        4  6   10
	//       3    8

	// log2(1000) ~= 10
	// How would /preorder/ traversal affect the printing of our bst?
	// callback
	// traverse(left), traverse(right)
	//     	// our tree:
	//    5				 	 1
	//  3   7			 2	 5
	// 2 4 6 8		3 4	6 7
	root.traversePreorder(func(arg int) {
		fmt.Printf("%v, ", arg)
	})
	fmt.Println()
	// How would /postorder/ traversal affect the printing of our bst?
	// taverse(left), traverse(right)
	// callback
	//     	// our tree:
	//    5				   7
	//  3   7			 3   6
	// 2 4 6 8		1 2 4 5
	root.traversePostorder(func(arg int) {
		fmt.Printf("%v, ", arg)
	})
	fmt.Println()

}
