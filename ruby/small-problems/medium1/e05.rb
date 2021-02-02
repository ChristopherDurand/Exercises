def print_full_line(line_size, diamond_size)
  print " " * ((diamond_size - line_size) / 2) 
  print "*" * line_size 
  print " " * ((diamond_size - line_size) / 2)
  puts
end

def print_empty_line(line_size, diamond_size)
  print " " * ((diamond_size - line_size) / 2)
  if line_size == 1
    print "*"
  else
    print "*" + " " * (line_size - 2) + "*"
  end
  print " " * ((diamond_size - line_size) / 2)
  puts
end


def diamond(size, filled:)
  size_array = []
  1.step(by: 2, to: size).with_index do |n, idx|
    size_array.insert(idx, n)
    size_array.insert(idx, n) unless n == size
  end
  size_array.each do |n|
    if filled
      print_full_line(n, size)
    else
      print_empty_line(n, size)
    end
  end
end

diamond(5,filled: true)
puts
diamond(7,filled: true)
puts

diamond(1,filled: true)
puts
diamond(3,filled: true)
puts

diamond(5,filled: false)
puts
diamond(7,filled: false)
puts

diamond(3,filled: false)
puts
diamond(1,filled: false)
puts
