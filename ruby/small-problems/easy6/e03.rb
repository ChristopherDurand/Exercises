#Fibonacci Number Location by Length  

def num_digits(num)
  num.to_i.to_s.length
end

def find_fibonacci_index_by_length(n)
  answer = 3
  #start with 1, 1.
  fib_1_ago, fib_2_ago = 1, 1
  number_to_check = fib_1_ago + fib_2_ago
  while num_digits(number_to_check) < n
    fib_2_ago, fib_1_ago = fib_1_ago, number_to_check
    number_to_check = fib_1_ago + fib_2_ago
    answer += 1
  end
  answer
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
puts find_fibonacci_index_by_length(2)# == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3)# == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10)# == 45
puts find_fibonacci_index_by_length(100)# == 476
puts find_fibonacci_index_by_length(1000)# == 4782
puts find_fibonacci_index_by_length(10000)# == 47847