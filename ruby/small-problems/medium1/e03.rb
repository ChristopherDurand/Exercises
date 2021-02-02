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

def rotate_rightmost_chars(str, chars)
  str[0..-(chars+1)] + rotate_string(str[(-chars)..-1])
end

def max_rotation(num)
  num = num.to_s
  num.length.downto(2) do |chars| 
    num = rotate_rightmost_chars(num, chars)
  end
  num.to_i
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(20000_000_146) #== 7_321_609_845