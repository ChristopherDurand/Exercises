def get_grade(g1, g2, g3)
  grade = (g1 + g2 + g3) / 3.0
  case grade
  when 90..100 then "A" 
  when 80..90  then "B"
  when 70..80  then "C"
  when 60..70  then "D"
  when 0..60   then "F"   
  end
end


puts get_grade(90, 90, 89.99999999999999999999)# == "A"
puts get_grade(50, 50, 95) #== "D"