

def center_of(str)
  center = (str.length / 2.0).floor
  if str.length.odd?
    str[center]
  else
    str[center-1,2]
  end
end


puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'