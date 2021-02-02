
=begin
# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

  In group one, a proc is defined as my_proc. It's class is proc, and when its
  called without a block, it doesn't care and assigns nil to the variable thing.
  it then outputs "This is a ." because Thing is nil. The second call works as
  expected and outputs "This is a cat."  
=end

=begin
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

   => In group two, two labdas are defined using different methods. They are both
   instances of the proc class. They are strict about the number of arguments.
   Lambda.new will not work because it is not a class, but a type of proc it seems.
=end

# Group 3
=begin
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')
  In group three, a method is defined that takes one parameter and stores it
  in animal. The method yields to the block passed, and does not yield any parameters.
  Because of this, on line 37, seal is set to nil and prints "This is a ."
  On line 38, a Local Jump Error is raised because there is no block to jump to.
=end
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}