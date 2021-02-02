def double_consonants(string)
  string.gsub(/[qwrtypsdfghjklzxcvbnm]/i) { |s| s + s }
end


puts double_consonants('String') #== "SSttrrinngg"
puts double_consonants('String') == "SSttrrinngg"

puts double_consonants("Hello-World!") #== "HHellllo-WWorrlldd!"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"

puts double_consonants("July 4th") #== "JJullyy 4tthh"
puts double_consonants("July 4th") == "JJullyy 4tthh"

puts double_consonants('') #== ""
puts double_consonants('') == ""
