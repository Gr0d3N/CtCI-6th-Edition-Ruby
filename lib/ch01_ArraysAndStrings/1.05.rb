# page 91
# One Away: There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.

def one_away(a, b)
  letter_diff = Hash.new(0)

  if (a.length - b.length).abs > 1
    return false
  else
    a.length.times { |i| letter_diff[a[i]] += 1}
    b.length.times { |i| letter_diff[a[i]] -= 1}
    letter_diff.keys.each do |letter|
      letter_diff.delete(letter) if letter_diff[letter] == 0
    end
    return false if letter_diff.length > 1
  end

  return true
end
