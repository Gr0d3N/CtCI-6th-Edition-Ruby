# page 91
# String Compression: Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a - z).

def str_comp(str)
  original_length = str.length
  compressed = ""
  compressed_length = 0

  count = 1
  
  original_length.times do |i|
    if str[i] == str[i+1]
      count += 1
    else
      compressed += str[i] + count.to_s 
      compressed_length += 2
      count = 1
    end

    return str if compressed_length >= original_length
  end

  return compressed
end
