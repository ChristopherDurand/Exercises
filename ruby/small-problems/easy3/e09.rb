def palindrome?(test_string)
  test_string.reverse == test_string
end

def real_palindrome?(test_string)
  characters = test_string.downcase.split("")
  alphanumerics = characters.select{|char| /^[a-zA-Z0-9]$/.match(char)}
  palindrome?(alphanumerics)
end

puts real_palindrome?("madam")
puts real_palindrome?("Madam")
puts real_palindrome?("Madam, I'm Adam")
puts real_palindrome?("AAAAAAAAAAAAAAAAAAAA")
