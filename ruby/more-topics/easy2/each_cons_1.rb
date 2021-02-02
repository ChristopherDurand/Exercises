
def each_cons(arr)
  i = 0
  slice_size = 2
  slices = []
  while i+slice_size-1 < arr.size
    j = 0
    slices << []
    while j < slice_size
      slices[i] << arr[i+j]
      j += 1
    end
    i += 1
  end
  slices.each do |args|
    yield(*args)
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
