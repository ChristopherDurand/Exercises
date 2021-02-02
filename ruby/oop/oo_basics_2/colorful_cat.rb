class Cat
  attr_reader :name
  @@total_number_of_cats = 0
  COLOR = "purple"

  def initialize(name)
    @@total_number_of_cats += 1
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat!"
  end

  def self.total
    puts @@total_number_of_cats
  end

end

kitty1 = Cat.new("D")
kitty2 = Cat.new("S")
kitty1.greet