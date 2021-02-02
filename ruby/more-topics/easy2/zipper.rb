
def zip(a, b)
  result = []
  0.upto(a.size-1) do |idx|
    result << [a[idx], b[idx]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]