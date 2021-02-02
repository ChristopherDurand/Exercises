def time_of_day(minutes_after_midnight)
  hours_after_midnight = (minutes_after_midnight / 60).floor
  minutes = minutes_after_midnight - hours_after_midnight * 60
  hours = hours_after_midnight % 24
  minutes = (minutes < 10 ? "0" : "") + minutes.to_s
  hours = (hours < 10 ? "0" : "") + hours.to_s
  "#{hours}:#{minutes}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
puts time_of_day(0)
puts time_of_day(-3)
puts time_of_day(35) 
puts time_of_day(-1437)
puts time_of_day(3000)
puts time_of_day(800)
puts time_of_day(-4231)