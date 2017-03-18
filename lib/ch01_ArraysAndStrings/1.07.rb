# page 91
# Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

def rotate_matrix(matrix)
  n = matrix.length

  (n/2).times do |layer|
    final = n - 1 - layer

    (layer..final-1).each do |i|
      offset = i - layer

      # Saving the top layer
      top = matrix[layer][i]

      # Left to top
      matrix[layer][i] = matrix[final - offset][layer]
      
      # Bottom to left
      matrix[final - offset][layer] = matrix[final][final - offset]

      # Right to bottom
      matrix[final][final - offset] = matrix[i][final]

      # Top to right
      matrix[i][final] = top
    end
  end

  return matrix
end
