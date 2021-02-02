class Cat
  attr_reader :name
  @@total_number_of_cats = 0

  def initialize(name)
    @@total_number_of_cats += 1
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{@name}!"
  end

  def self.total
    puts @@total_number_of_cats
  end

end

kitty1 = Cat.new("D")
kitty2 = Cat.new("S")

Cat.total