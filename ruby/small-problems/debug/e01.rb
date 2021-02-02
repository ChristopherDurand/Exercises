TIME = 10

def decrease(counter)
  counter -= 1
end

counter = TIME

TIME.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'