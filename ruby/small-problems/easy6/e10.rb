#Right Triangles

def triangle(n)
  (1..n).to_a.each do |num|
    puts " " * (n - num) + "*" * num
  end
end

triangle(5)

triangle(9)
triangle(12)
