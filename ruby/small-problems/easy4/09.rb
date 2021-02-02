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



puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'