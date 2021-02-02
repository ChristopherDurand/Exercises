def staggered_case(string, first_upper:, exclude_non_alphabetic:)
  first_upper = !first_upper
  string.chars.map do |char|
    first_upper = !first_upper if /[a-z]/i =~ char || !exclude_non_alphabetic
    first_upper ? char.upcase : char.downcase
  end.join("")
end

puts staggered_case('I Love Launch School!',first_upper: true,exclude_non_alphabetic: true) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS',first_upper: true,exclude_non_alphabetic: true) == 'AlL cApS'

puts staggered_case('ignore 77 the 444 numbers',first_upper: true,exclude_non_alphabetic: false)# == 'IgNoRe 77 ThE 444 nUmBeRs'