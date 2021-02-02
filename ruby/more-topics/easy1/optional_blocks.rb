def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute: #{arg}"
  end
end


puts compute(5)
puts compute(5) { |arg| arg + 10 }
puts compute("no!") { |arg| "hell " + arg }

