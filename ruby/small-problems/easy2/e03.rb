print "What is the bill? $"
bill = gets.chomp.to_f
print "What is the tip percentage? "
percentage = gets.chomp.to_f / 100

tip = bill * percentage
total = tip + bill

puts "The tip is $#{format("%.2f",tip)}."
puts "The bill is $#{format("%.2f",total)}."
