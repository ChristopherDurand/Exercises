
def light_game(number_of_lights)
  lights = Array.new(number_of_lights, false)
  1.upto(number_of_lights) do |n|
    0.step(by: n, to: number_of_lights - 1) do |idx|
      lights[idx] = !lights[idx]
    end
  end
  lights.map.with_index do
    |on, idx| on ? idx : 0 
  end.select { |n| n > 0 }  
end

print light_game(5)
puts
print light_game(10)
puts