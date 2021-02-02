def fibonacci(n)
  if n < 3
    1
  else
    fibonacci(n-2) + fibonacci(n-1)
  end
end



puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765