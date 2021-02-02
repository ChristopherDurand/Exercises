class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
puts Cat.ancestors
cat1.color

#[Cat, Animal, Object, Kernel, BasicObject]
