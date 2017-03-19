# Page 91
# Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.

def zero_matrix(matrix)
  rows = Hash.new()
  cols = Hash.new()
  m = matrix.length   
  n = matrix[0].length 

  m.times do |r|
    n.times do |c|
      if matrix[r][c] == 0
        rows[r] = true
        cols[c] = true
      end
    end
  end

  rows.each { |k, v| n.times { |c| matrix[k][c] = 0 }}
  cols.each { |k, v| m.times { |r| matrix[r][k] = 0 }}

  return matrix
end
