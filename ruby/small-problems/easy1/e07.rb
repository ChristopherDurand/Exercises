def stringy(n)
  count = 0
  string = ''
  while count < n
    if count % 2 == 1
      string << "0"
    else
      string << "1"
    end
    count += 1
  end
  string
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'