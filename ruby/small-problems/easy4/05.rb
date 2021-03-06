

def multisum(num)
  ans = 0
  (1..num).each do |n|
    if n % 3 == 0 || n % 5 == 0
      ans += n
    end
  end
  ans
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168