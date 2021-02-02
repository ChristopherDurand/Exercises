def palindrome?(test_string)
  test_string.reverse == test_string
end



puts palindrome?("madam")
puts palindrome?("Madam")
puts palindrome?("AAAAAAAAAAAAAAAAAAAA")
