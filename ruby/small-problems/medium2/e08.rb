def unique_digits?(num)
  num.to_s.chars.uniq.join("").to_i == num
end

def featured(num)
  
  n = num +1
  n += 1 until n.odd? && n % 7 == 0

  (n).step(by: 14, to: 9_876_543_210) do |test|
    return test if unique_digits?(test)
  end

  "There is no number greater than #{num} that is featured."
end

puts featured(12) #== 21
puts featured(20) #== 21
puts featured(21) #== 35
puts featured(997) #== 1029
puts featured(1029) #== 1043
puts featured(999_999)#== 1_023_547
puts featured(999_999_987) #== 1_023_456_987
puts featured(9_876_543_210)
