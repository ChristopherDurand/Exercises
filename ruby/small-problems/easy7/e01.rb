#Combine Two Lists

def interleave(a, b)
  ans = []
  a.each_with_index do |element, idx|
    ans << element << b[idx]
  end
  ans
end

def zip_interleave(a,b)
  a.zip(b).flatten
end

print interleave([1, 2, 3], ['a', 'b', 'c'])# == [1, 'a', 2, 'b', 3, 'c']
puts
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']