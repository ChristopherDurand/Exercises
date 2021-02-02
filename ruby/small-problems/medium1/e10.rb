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

def fibonacci_last(n)
  if n <= 2
    1
  else
    a, b = 1, 1
    (n-2).times do 
      a, b = b, (a + b) % 10 
      puts b
    end
    b
  end
end
def fast_fib_last(n)
  arr = "112358314594370774156178538190998752796516730336954932572910".chars.map(&:to_i)
  arr[(n - 1)%60]
end

puts fast_fib_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fast_fib_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fast_fib_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fast_fib_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fast_fib_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fast_fib_last(123456789) # -> 4