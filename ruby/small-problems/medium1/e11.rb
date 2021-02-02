def fibonacci(n)
  result = [1, 1]
  if n <= 2
    1
  else
    a, b = 1, 1
    (n-2).times do 
      a, b = b, a + b
      result << b % 10
    end
    ans = ""
    print result.join("").match(/(.+)(?=\1)/)
  end
end
puts "112358314594370774156178538190998752796516730336954932572910".length
