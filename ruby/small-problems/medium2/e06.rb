def valid_triangle?(a, b, c)
  a + b + c == 180 && a > 0 && b > 0 && c > 0
end

def triangle(a, b, c)
  angles = [a, b, c]
  case
  when !valid_triangle?(*angles)
    :invalid
  when angles.include?(90)
    :right
  when angles.any? { |a| a > 90 }
    :obtuse
  else
    :acute
  end
end


puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid