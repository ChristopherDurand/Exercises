def word_sizes(sentence)
  sentence.split(" ").each_with_object(Hash.new(0)) do |word,hsh|
    idx = 0
    word.chars.each do |char|
      idx += 1 if /[a-zA-Z]/ =~ char
    end
    hsh[idx] += 1
  end
end

print word_sizes('Four score and seven.')== { 3 => 1, 4 => 1, 5 => 2 }
print word_sizes('Hey diddle diddle, the cat and the fiddle!')== { 3 => 5, 6 => 3 }
print word_sizes("What's up doc?")== { 5 => 1, 2 => 1, 3 => 1 }
print word_sizes('')== {}
