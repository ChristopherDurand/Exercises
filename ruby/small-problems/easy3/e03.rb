puts "Please write word or multiple words:"
words = gets.chomp
count = 0
words.split("").each do |char|
  count += 1 unless char == ' '
end

puts "There are #{count} characters in \"#{words}\""
