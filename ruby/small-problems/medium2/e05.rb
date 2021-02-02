
def valid_triangle?(a, b, c)
  a, b, c = [a, b, c].sort
  a > 0 && b > 0 && c > 0 && a + b > c
end

def triangle(a, b, c)
  if valid_triangle?(a, b, c)
    sides = Hash.new(0)
    [a, b, c].each { |n| sides[n] += 1 }
    num_same = sides.max_by { |length, ct| ct }[1]
    case num_same
    when 1 then :scalene
    when 2 then :isosceles
    when 3 then :equilateral
    end
  else
    :invalid
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid