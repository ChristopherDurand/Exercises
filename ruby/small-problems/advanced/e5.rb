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

def mirror(matrix)
  matrix.map do |row|
    row.reverse
  end
end

def rotate90(matrix)
  mirror(transpose(matrix))
end

def rotate(matrix, amount)
  return nil if amount % 90 != 0
  n = (amount / 90) % 4
  n.times { matrix = rotate90(matrix) }
  matrix
end

  


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
p rotate(matrix1, 180)
matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2