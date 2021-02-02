def multiply_all_pairs(a, b)
  a.product(b).map { |pair| pair.reduce(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]