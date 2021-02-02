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
puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]