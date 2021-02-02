def egyptian(r)
  result = []
  #Starting at 1, check if 1/n is equal to remainder.
  #If it is equal, add n to result, and break result.
  #If it is smaller, add n to result, subtract 1/n from r.
  loop.with_index do |_, n|
    check = Rational(1, n + 1)
    if r - check == 0r
      break result << n+1
    elsif r - check > 0r
      r -= check
      result << n+1
    end
  end
end

def unegyptian(arr)
  arr.inject(0r) { |sum, num| sum + Rational(1, num) }
end

print egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
print egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
print egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

puts
print unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
puts
print unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
puts
print unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
puts
print unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
puts
print unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
puts
print unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
puts
print unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
puts
print unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
puts