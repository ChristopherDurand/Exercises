
text = open("book.txt").read

sentences = text.split(/(?<=[.?!])/)
longest_sentence = sentences.max_by { |s| s.split.size }
puts "Size of longest sentence: #{longest_sentence.split.size}"
puts longest_sentence

puts "\n\n"

paragraphs = text.split(/\n\n/)
longest_paragraph = paragraphs.max_by { |p| p.split.size }
puts "Size of longest paragraph: #{longest_paragraph.split.size}"
puts longest_paragraph
