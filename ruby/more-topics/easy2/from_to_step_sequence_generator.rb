def step(from, to, step)
  counter = from
  while counter <= to
    yield(counter)
    counter += step
  end
  to
end

step(1, 10, 3) { |value| puts "value = #{value}" }