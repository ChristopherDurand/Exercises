def staggered_case(string, first_upper:)
  first_upper = !first_upper
  string.chars.map do |char|
    first_upper = !first_upper
    first_upper ? char.upcase : char.downcase
  end.join("")
end

puts staggered_case('I Love Launch School!',first_upper: false)# == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS',first_upper: true) == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers',first_upper: true) == 'IgNoRe 77 ThE 444 NuMbErS'