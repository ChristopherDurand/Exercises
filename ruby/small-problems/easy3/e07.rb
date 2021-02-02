def oddities(array)
  array.select.with_index { |value,index| value if index % 2 == 1}
end

