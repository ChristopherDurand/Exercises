def short_long_short(a,b)
  if a.length < b.length
    short = a
    long = b
  else
    long = a
    short = b
  end
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"