def transpose(matrix)
  cols = matrix[0].length
  rows = matrix.length
  cols.times.with_object([]) do |col, ans|
    ans << []
    rows.times do |row|
      ans[col][row] = matrix[row][col]
    end
  end
end

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]