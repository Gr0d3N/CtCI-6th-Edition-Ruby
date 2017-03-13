# page 90
# Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

def is_unique?(str)
  char_set = Hash.new()
  str.each_char do |i|
    return false if char_set[i] == true
    char_set[i] = true
  end
  return true
end
