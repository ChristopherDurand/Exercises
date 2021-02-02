numbers = []

places = %w(1st 2nd 3rd 4th 5th)

(0..4).each do |n|
  puts "Enter the #{places[n]} number:"
  numbers[n] = gets.chomp.to_i
end

puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else 
  puts "The number #{last_number} does not appear in #{numbers}."
end
