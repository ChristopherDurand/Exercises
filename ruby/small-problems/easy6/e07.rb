#Halvsies

def halvsies(arr)
  length_of_first = (arr.length.to_f / 2).ceil
  length_of_second = (arr.length.to_f / 2).floor
  [arr[0,length_of_first], arr[length_of_first,length_of_second]]
end

print halvsies([1, 2, 3, 4])# == [[1, 2], [3, 4]]
puts 
print halvsies([1, 5, 2, 4, 3])# == [[1, 5, 2], [4, 3]]
puts 
print halvsies([5])# == [[5], []]
puts 
print halvsies([])# == [[], []]

puts 
puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
