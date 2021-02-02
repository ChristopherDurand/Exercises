class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
  def to_s
    "#{@name} is #{@age}"
  end
end

class Cat < Pet
  def initialize(name, age, fur_color)
    super(name, age)
    @fur_color = fur_color
  end
  def to_s
    "My cat " + super + " and has #{@fur_color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch