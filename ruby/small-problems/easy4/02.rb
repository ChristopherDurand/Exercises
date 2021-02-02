
def century(year)
  ans = (year/100.0).ceil
  if (ans/10).ceil % 10 == 1
    ans.to_s + "th"
  else
    case ans % 10
    when 1
      ans.to_s + "st"
    when 2
      ans.to_s + "nd"
    when 3
      ans.to_s + "rd"
    else
      ans.to_s + "th"
    end
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
