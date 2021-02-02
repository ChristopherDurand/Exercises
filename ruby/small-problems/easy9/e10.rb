def buy_fruit(grocery_list)
  grocery_list.map do |fruit, quantity|
    0.upto(quantity-1).map { |_| fruit }
  end.flatten
end

print buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) 
puts
