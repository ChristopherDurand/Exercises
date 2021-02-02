
def transpose(matrix)
  0.upto(2).with_object([[],[],[]]) do |row, ans|
    0.upto(2) do |col|
      ans[col][row] = matrix[row][col]
    end
  end
end

def transpose!(matrix)
  0.upto(2) do |r|
    r.times do |c|
      matrix[c][r], matrix[r][c] = matrix[r][c] , matrix[c][r]
    end
  end
end
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
matrix.each {|l| print l, puts }
transpose!(matrix)
matrix.each {|l| print l, puts }
