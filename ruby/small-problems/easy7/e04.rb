# Swap Case

def swapchar(char)
  if char.upcase == char
    char.downcase
  else
    char.upcase
  end
end

def swapcase(string)
  string.chars.map{ |char| swapchar(char) }.join("")
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV')  == 'tONIGHT ON xyz-tv'