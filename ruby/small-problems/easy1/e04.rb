def count_occurrences(vehicles)
  count = Hash.new
  count.default = 0
  vehicles.each {|vehicle| count[vehicle] += 1}
  count.each {|vehicle, amount| puts "#{vehicle} => #{amount}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)