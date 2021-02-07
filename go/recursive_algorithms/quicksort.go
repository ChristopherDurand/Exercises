package main

import "fmt"

func partition(nums []int, left, right int) int {
	pivotIndex := right
	pivot := nums[pivotIndex]
	right -= 1
	for {
		for nums[left] < pivot {
			left++
		}
		for nums[right] > pivot && right > 0 {
			right--
		}
		if left >= right {
			break
		} else {
			nums[left], nums[right] = nums[right], nums[left]
			left += 1
		}
	}
	nums[left], nums[pivotIndex] = nums[pivotIndex], nums[left]
	return left
}

func highestTriple(nums []int) int {
	nums = quickSort(nums)
	return nums[len(nums)-1] * nums[len(nums)-2] * nums[len(nums)-3]
}

func quickSort(nums []int) []int {
	if len(nums) < 2 {
		return nums
	}
	pivot := partition(nums, 0, len(nums)-1)
	result := append(quickSort(nums[:pivot]), nums[pivot])
	result = append(result, quickSort(nums[(pivot+1):])...)
	return result
}

func findMissingNumber(nums []int) int {
	nums = quickSort(nums)
	fmt.Println(nums)
	for i := 0; i < len(nums)-2; i++ {
		if nums[i+1]-nums[i] != 1 {
			return nums[i] + 1
		}
	}
	return -1
}

func highestN2(nums []int) (highest int) {
	for i := 0; i < len(nums); i++ {
		foundHighest := true
		for j := 0; j < len(nums); j++ {
			if nums[j] > nums[i] {
				foundHighest = false
			}
		}
		if foundHighest {
			highest = nums[i]
			break
		}
	}
	return
}

func highestNLN(nums []int) int {
	return quickSort(nums)[len(nums)-1]
}

func quickSelect(nums []int, nthLowest, left, right int) int {
	if right-left <= 0 {
		return nums[left]
	}
	pivotIndex := partition(nums, left, right)
	if nthLowest < pivotIndex {
		return quickSelect(nums, nthLowest, left, pivotIndex-1)
	} else if nthLowest > pivotIndex {
		return quickSelect(nums, nthLowest, pivotIndex+1, right)
	} else {
		return nums[pivotIndex]
	}
}

func highestN(nums []int) int {
	return quickSelect(nums, len(nums)-1, 0, len(nums)-1)
}

func main() {
	nums := []int{5, 4, 3, 5, 7, 8, 6, 4, 2, 1, 3, 4, 5, 6}
	fmt.Println(quickSort(nums))
	nums = []int{5, 4, 3, 5, 7, 8, 6, 4, 2, 1, 3, 4, 5, 6}
	fmt.Println(highestTriple(nums))
	nums = []int{9, 3, 7, 6, 5, 2, 1, 0}
	fmt.Println(findMissingNumber(nums))
	nums = []int{9, 3, 7, 6, 5, 2, 1, 0}
	fmt.Println(highestN2(nums))
}
