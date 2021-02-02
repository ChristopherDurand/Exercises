#Palindromic strings

def substrings_at_start(string)
  string.chars.map.with_index { |_,idx| string[0,idx+1] }
end

def substrings(string)
  string.chars.map.with_index do |_,idx| 
    substrings_at_start(string[idx..-1])
  end.flatten
end

def alphanumeric(string)
  string.gsub(/[^a-zA-Z]/,"")
end

def palindrome?(string)
  anstr = alphanumeric(string)
  anstr == anstr.reverse && anstr.size > 1
end

def palindromes(string)
  substrings(string).select { |substr| palindrome?(substr) }
end

print palindromes('abcd')# == []
puts
print palindromes('madam') #== ['madam', 'ada']
puts
print palindromes('hello-madam-did-madam-goodbye')# == [  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada', 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did', '-madam-', 'madam', 'ada', 'oo']
puts
print palindromes('knitting cassettes')# == [ 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']
puts
