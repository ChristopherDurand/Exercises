def crunch(string)
  last_char = ""
  string.chars.map do |char|
    if char == last_char
      ""
    else
      last_char = char
    end
  end.join("")
end

def regex_crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

puts regex_crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts regex_crunch('4444abcabccba') == '4abcabcba'
puts regex_crunch('ggggggggggggggg') == 'g'
puts regex_crunch('a') == 'a'
puts regex_crunch('') == ''
puts regex_crunch('ddaaiillyy ddoouubbllee')# == 'daily double'
puts regex_crunch('4444abcabccba')# == '4abcabcba'
puts regex_crunch('ggggggggggggggg')# == 'g'
puts regex_crunch('a')# == 'a'
puts regex_crunch('')# == ''
