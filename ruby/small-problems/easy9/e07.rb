def swap_name(person)
  words = person.split
  words[1] + ", " + words[0]
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'