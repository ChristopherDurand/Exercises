DIGITS = {1 => "1", 
          2 => "2", 
          3 => "3", 
          4 => "4", 
          5 => "5", 
          6 => "6", 
          7 => "7", 
          8 => "8", 
          9 => "9",
          0 => "0"}

def integer_to_string(num)
  ans = num == 0 ? "0" : ""
  loop do    
    break if num == 0
    ans = DIGITS[num%10] + ans
    num = (num/10).floor
  end
  ans
end

def signed_integer_to_string(num)
  if num > 0
    "+" + integer_to_string(num)
  elsif num < 0
    "-" + integer_to_string(-num)
  else
    "0"
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
