
def any?(array)
  array.each do |elem|
    return true if yield(elem)
  end
  false
end

def all?(array)
  array.reduce(true) do |memo, elem|
    return false unless memo && yield(elem)
  end
end

a = {dad: 3, mom: "mom"}
p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true