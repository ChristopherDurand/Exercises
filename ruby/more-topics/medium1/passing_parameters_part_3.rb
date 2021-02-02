items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*stuff, other|
  puts stuff.join(", ")
  puts other
end

gather(items) do |one, *stuff, other|
  puts one
  puts stuff.join(", ")
  puts other
end

gather(items) do |other, *stuff|
  puts other
  puts stuff.join(", ")
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end