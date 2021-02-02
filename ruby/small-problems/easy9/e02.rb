
def double_num?(num)
  str = num.to_s
  if str.size.even?
    str[0,str.size/2] == str[str.size/2,str.size]
  else
    false
  end
end

def twice(num)
  if double_num?(num)
    num
  else
    2 * num
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10