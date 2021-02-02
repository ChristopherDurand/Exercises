class Person
  def age=(a)
    @age = 2 * a
  end
  def age
    2 * @age
  end
end

person1 = Person.new
person1.age = 20
puts person1.age