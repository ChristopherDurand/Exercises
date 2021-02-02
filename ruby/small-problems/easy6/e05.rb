#Reversed Arrays pt 2 

def reverse(arr)
  arr.sort do |a, b|
    arr.index(b) <=> arr.index(a)
  end
end



list = [[1,2],[2,3],4]
print list
puts
print "ID: #{list.object_id}"

puts
new_list = reverse(list)
print new_list
puts
print "ID: #{new_list.object_id}"

puts
print list
puts
print "ID: #{list.object_id}"

puts