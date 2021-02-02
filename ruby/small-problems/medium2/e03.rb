def letter_percentages(string)
  upper = 0
  lower = 0
  neither = 0
  total = string.length.to_f / 100
  string.each_char do |char|
    if /[a-z]/ =~ char
      lower += 1
    elsif /[A-Z]/ =~ char
      upper += 1
    else
      neither += 1
    end
  end
  {
    uppercase: (upper / total).round(2), 
    lowercase: (lower / total).round(2),
    neither: (neither / total).round(2)
  }
end

puts letter_percentages('abcdefGHI') #== { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }