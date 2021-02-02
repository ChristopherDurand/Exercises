class Person
  def name=(n)
    @name = n.capitalize
  end
  def name
    @name
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name