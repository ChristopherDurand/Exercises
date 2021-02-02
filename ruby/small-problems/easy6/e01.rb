# Cute Angles
DEGREES_PER_REVOLUTION = 360
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(angle)
  degrees = angle % DEGREES_PER_REVOLUTION 
  minutes = (angle * MINUTES_PER_DEGREE) % MINUTES_PER_DEGREE
  seconds = (angle * SECONDS_PER_DEGREE) % SECONDS_PER_MINUTE
  format('%.1d°%.2d\'%.2d"',degrees, minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) #== %(40°00'00")
puts dms(-40) #== %(320°00'00")
puts dms(-420)# == %(300°00'00")