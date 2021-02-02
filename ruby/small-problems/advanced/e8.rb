def which?(a, b)
  if a && b
    case a <=> b
      when -1    then :a
      when 0..1 then :b
    end
  else
    if a
      :a
    elsif b
      :b
    else
      :none
    end
  end
end

def merge(a, b)
  ia, ib = 0, 0
  loop.with_object([]) do |_,result|
    case which?(a[ia], b[ib])
    when :a
      result << a[ia]
      ia += 1
    when :b
      result << b[ib]
      ib += 1
    when :none
      break result
    end
  end
end

def merge_sort(arr)
  if arr.size > 1
    mid = arr.size / 2
    merge(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))
  else
    arr
  end
end


puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]