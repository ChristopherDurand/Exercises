#Delete Vowels

def remove_vowels(array_of_strings)
  array_of_strings.map { |str| str.gsub(/[aeiou]/i,'') }
end

print remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)

print remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)

print remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']