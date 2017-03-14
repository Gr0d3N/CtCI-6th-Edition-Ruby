# page 90
# Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

# Solution 1

def is_unique?(str)
  str.length.times do |i|
    return false if str.count(str[i]) > 1
  end
  return true
end


# Solution 2

def is_unique2?(str)
  char_set = Hash.new()
  str.each_char do |i|
    return false if char_set[i] == true
    char_set[i] = true
  end
  return true
end
