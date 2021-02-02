def repeater(string)
  string.gsub(/(.)/,"\1\1")
end
def repeater2(string)
  string.gsub(/./) { |s| s + s }
end

puts repeater('Hello') #== "HHeelllloo"
puts repeater("Good job!") #== "GGoooodd  jjoobb!!"
puts repeater('') #== ''
puts repeater2('Hello') #== "HHeelllloo"
puts repeater2("Good job!") #== "GGoooodd  jjoobb!!"
puts repeater2('') #== ''