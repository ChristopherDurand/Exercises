def missing(array)
  lower = array.first
  upper = array.last
  (lower..upper).to_a - array
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5])# == [2, 3, 4]
p missing([6])# == []