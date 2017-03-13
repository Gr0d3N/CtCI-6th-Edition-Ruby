# page 91
# Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
#
# EXAMPLE
# Input: Tact Coa
# Output: True (permutations: "taco cat'; "atc o eta·; etc.)

def is_palindrome_permutation(str)
  chars = Hash.new(0)
  str_length = 0

  str.length.times do |i|
    if str[i].match(/\w/)
      chars[str[i].downcase] += 1
      str_length += 1
    end
  end

  odd_occuring_letters = chars.select { |k, v| v.odd? }.length

  if str_length.odd?
    return odd_occuring_letters == 1 ? true : false
  else
    return odd_occuring_letters == 0 ? true : false
  end
end
