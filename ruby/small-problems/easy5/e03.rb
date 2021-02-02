def after_midnight(time)
  hours = time[0,2].to_i
  minutes = time[3,2].to_i
  (hours * 60 + minutes) % (24 * 60)
end

def before_midnight(time)
  (24 * 60 - after_midnight(time)) % (24 * 60)
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0