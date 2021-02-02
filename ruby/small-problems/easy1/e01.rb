=begin
  
Repeat Yourself

Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.
 => e
  
=end

def repeats(string, amount)
  amount.times {puts string}
end

repeats("this",5)

repeats("orange",20)