fact = Enumerator.new do |num|
  acc = 1
  n = 1
  loop do
    num << acc
    n+= 1    
    acc = acc * n
  end
end

7.times do |n|
  puts fact.next
end
fact.rewind
p fact.take(7)