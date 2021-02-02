
def multiply_list(a, b)
  list = []
  a.each_with_index do |element, idx|
    list << element * b[idx]
  end
  list
end

def one_liner(a, b)
  a.zip(b).map { |x, y| x * y }
end

print one_liner([3, 5, 7], [9, 100, 11])