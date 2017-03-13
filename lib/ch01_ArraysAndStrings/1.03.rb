# page 90
# URLify: Write a method to replace all spaces in a string with '%20  You may assume that the string has suf cient space at the end to hold the additional characters,and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)
# EXAMPLE
# Input: "Mr John Smith ", 13 Output: "Mr%20John%20Smith"

def URLify(str, len)
  str = str[0..len-1]

  str.length.times do |i|
    str[i] = "%20" if str[i] == " "
  end

  return str
end
