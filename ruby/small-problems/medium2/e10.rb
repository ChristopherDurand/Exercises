def square_sums(n)
  1.upto(n).inject(&:+) ** 2
end

def sum_squares(n)
  1.upto(n).inject(0) { |ans, idx| ans + idx**2 }
end

def sum_square_difference(n)
  square_sums(n) - sum_squares(n)
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150