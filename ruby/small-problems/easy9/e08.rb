def sequence(length, multiple)
  (1..length).to_a.map{ |n| n * multiple }
end

print sequence(5, 1) == [1, 2, 3, 4, 5]
puts
print sequence(4, -7) == [-7, -14, -21, -28]
puts
print sequence(3, 0) == [0, 0, 0]
puts
print sequence(0, 1000000) == []
puts
