def asequence(num)
  1.upto(num).to_a
end

def sequence(num)
  if num < 1
    1.downto(num).to_a
  else
    1.upto(num).to_a
  end
end

print sequence(6)
puts
print sequence(10)
puts
print sequence(0)
puts
print sequence(-5)
puts
print sequence(-1)
puts

