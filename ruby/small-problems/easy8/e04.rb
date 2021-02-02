def substrings_at_start(string)
  string.chars.map.with_index { |_,idx| string[0,idx+1] }
end

def substrings(string)
  string.chars.map.with_index do |_,idx| 
    substrings_at_start(string[idx..-1])
  end.flatten
end

print substrings('abcde')
puts
puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]