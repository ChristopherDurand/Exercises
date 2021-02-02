#Reversed Arrays pt 1

def reverse!(arr)
  copy = arr.map { |part| part }
  arr.clear
  copy.each {|part| arr.unshift(part)}
end

list = [[1,2],[2,3],4]
print list
puts
print "ID: #{list.object_id}"

puts
reverse!(list)
print list
puts
print "ID: #{list.object_id}"

