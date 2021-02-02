def show_multiplicative_average(arr)
  mult_avg =  arr.inject(1, :*).to_f / arr.size
  puts format("The result is %.3f", mult_avg)
end

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2, 5, 7, 11, 13, 17])