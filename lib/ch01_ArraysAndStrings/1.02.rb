# page 90
# Check Permutation: Given two strings,write a method to decide if one is a permutation of the other.

def is_permutation?(a,b)
  a_chars, b_chars = Hash.new(), Hash.new()

  return false if a.length != b.length

  a.length.times do |i|
    a_chars[a[i]] = true
    b_chars[b[i]] = true
  end

  a_chars.each do |x, y|
    return false if y != b_chars[x]
  end

  return true
end
