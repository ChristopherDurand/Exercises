def rotate_array(arr)
  arr.map.with_index { |elem, idx| arr[(idx+1) % arr.length] }
end

def rotate_string(string)
  rotate_array(string.chars).join("")
end

def rotate_rightmost_digits(num, digits)
  str = num.to_s
  new_str = str[0..-(digits+1)] + rotate_string(str[(-digits)..-1])
  new_str.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917