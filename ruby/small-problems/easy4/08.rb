CONVERT = {"1" => 1, "2" => 2,
        "3" => 3, "4" => 4,
        "5" => 5, "6" => 6,
        "7" => 7, "8" => 8,
        "9" => 9, "0" => 0,
        "A" => 10, "B" => 11,
        "C" => 12, "D" => 13,
        "E" => 14, "F" => 15}


def string_to_integer(input)
  number = 0
  input.chars.reverse.each_with_index do |char,i|
    number += CONVERT[char] * 10**i
  end
  number
end

def string_to_signed_integer(input)
  if input[0] == "+"
    string_to_integer(input[1..-1])
  elsif input[0] == "-"
    -1 * string_to_integer(input[1..-1])
  else
    string_to_integer(input)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
