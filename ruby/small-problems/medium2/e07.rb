DAY = 60 * 60 * 24
def friday_13th(year)
  time = Time.new(year)
  12.times.inject(0) do |count| 
    loop do 
      time += DAY
      break if time.day == 13
    end
    count + (time.friday? ? 1 : 0)
  end
end

def five_friday_months(year)
  time = Time.new(year)
  (1..12).each.with_object(0).inject(0) do |count, (month, fridays)|
    count + loop do
      fridays += 1 if time.friday?  
      time += DAY
      break (fridays == 5 ? 1 : 0)  if time.month != month  
    end
  end
end

puts five_friday_months(2020)


puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2