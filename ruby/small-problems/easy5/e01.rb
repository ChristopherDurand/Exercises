# ASCII String Value

def ascii_value(str)
  str.chars.inject(0) { |sum, chr| sum + chr.ord }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0