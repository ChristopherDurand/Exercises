def rotate_array(arr)
  arr.map.with_index { |elem, idx| arr[(idx+1) % arr.length] }
end

def rotate_string(string)
  rotate_array(string.chars).join("")
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

puts rotate_string("Wrong!")
puts rotate_integer(300201)


puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

puts x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4] 