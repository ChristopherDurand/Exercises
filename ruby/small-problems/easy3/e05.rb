def multiply(a, b)
  a * b
end

def square(a)
  multiply(a,a)
end

def powerof(a,n)
  n > 1 ? a * powerof(a,n-1) : a
end

puts powerof(5,2)
puts powerof(2,4)