
puts ">> Please enter an integer greater than 0:"
number = 0
loop do
  number = gets.chomp
  break if /^\d+$/.match(number) && number.to_i > 0
  puts ">> Error: please enter a valid number."
end
number = number.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
choice = ''
loop do
  choice = gets.chomp
  break if %w(s, p).include?(choice)
  puts ">> Error: please enter a valid choice."  
end

case choice
  when 's'
    sum = (1..number).inject(&:+)
    puts "The sum of the integers between 1 and #{number} is #{sum}."
  when 'p'
    product = (1..number).inject(&:*)
    puts "The product of the integers between 1 and #{number} is #{product}."
end