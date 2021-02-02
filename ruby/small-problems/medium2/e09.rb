def bubble_sort!(arr)
  1.upto(arr.length-1).with_object(true) do |nth,no_swaps|
    1.upto(arr.length-nth) do |idx|
      if arr[idx-1] > arr[idx]
        arr[idx-1], arr[idx] = arr[idx], arr[idx-1]
        no_swaps = false
      end
    end
    break if no_swaps
  end
end

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)