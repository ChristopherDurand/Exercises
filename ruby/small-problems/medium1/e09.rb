def fibonacci(n)
  if n <= 2
    1
  else
    a, b = 1, 1
    (n-2).times do 
      a, b = b, a + b
    end
    b
  end
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075