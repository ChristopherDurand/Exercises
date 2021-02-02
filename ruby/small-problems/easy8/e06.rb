def fizzbuzz_value(n)
  result = ""
  result += "Fizz" if n%3 == 0
  result += "Buzz" if n%5 == 0
  result == "" ? n.to_s : result
end

def fizzbuzz(start, ending)
  start.upto(ending) do |n|
    result = fizzbuzz_value(n)
    result += ", " unless n == ending
    print result
  end
  puts
end

fizzbuzz(1,15)