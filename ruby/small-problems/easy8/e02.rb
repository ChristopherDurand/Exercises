
def get_words(parts)
  parts.map do |part|
    print "Enter a #{part}: "
    gets.chomp
  end
end

parts_needed = %w(noun verb adjective adverb)
user_words = get_words(parts_needed)

puts "How #{user_words[3]} do you #{user_words[1]} your #{user_words[2]} #{user_words[0]}?"

