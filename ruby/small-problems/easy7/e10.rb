def penultimate(sentence)
  words = sentence.split
  words[-2]
end

# Edge Cases
# No words: return empty string
# Two words: should return the two words
# Even Words: Should return middle two
def middle_of(sentence)
  return "" if sentence == ""
  words = sentence.split
  if words.size % 2 == 0 
    words[words.size/2-1] + " " + words[words.size/2]
  else
    words[words.size/2]
  end
end

puts middle_of("This One Has Four")
puts middle_of("This Has Three")
puts middle_of("only two")
puts middle_of("one")
puts middle_of("")
puts middle_of("This Here Has Exactly Five")