puts "==> Enter the first number:"

first_number = gets.chomp.to_i

puts "==> Enter the second number:"

second_number = gets.chomp.to_i

add = first_number + second_number
subtract = first_number - second_number
multiply = first_number * second_number
divide = first_number / second_number
modulus = first_number % second_number
exponent = first_number ** second_number

puts "==> #{first_number} + #{second_number} = #{add}"
puts "==> #{first_number} - #{second_number} = #{subtract}"
puts "==> #{first_number} * #{second_number} = #{multiply}"
puts "==> #{first_number} / #{second_number} = #{divide}"
puts "==> #{first_number} % #{second_number} = #{modulus}"
puts "==> #{first_number} ** #{second_number} = #{exponent}"
