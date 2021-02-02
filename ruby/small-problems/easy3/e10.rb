def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

puts palindromic_number?(34543)
puts palindromic_number?(123210)
puts palindromic_number?(22)
puts palindromic_number?(5)