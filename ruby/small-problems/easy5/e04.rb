def flip_word(word)
  word = word.chars
  char = word[0]
  word[0] = word[-1]
  word[-1] = char
  word = word.join
end

def swap(sentence)
  sentence.split(" ").map { |word| flip_word(word) }.join(" ")
end


puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

