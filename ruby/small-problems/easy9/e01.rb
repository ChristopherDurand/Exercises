def greetings(namearr, hsh)
  puts "Hello, #{namearr.join(" ")}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

def rubogreet(name, hsh)
  sentence = "Hello, #{name.join(' ')}! "
  sentence += "Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
  puts sentence
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
rubogreet(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
