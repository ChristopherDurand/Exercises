def letter_case_count(str)
  {
    lowercase: str.scan(/[a-z]/).size,
    uppercase: str.scan(/[A-Z]/).size,
    neither: str.scan(/[^a-zA-Z]/).size
  }
end

print letter_case_count('abCdef 123')# == { lowercase: 5, uppercase: 1, neither: 4 }
puts
print letter_case_count('AbCd +Ef')# == { lowercase: 3, uppercase: 3, neither: 2 }
puts
print letter_case_count('123')# == { lowercase: 0, uppercase: 0, neither: 3 }
puts
print letter_case_count('')# == { lowercase: 0, uppercase: 0, neither: 0 }
puts
puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }