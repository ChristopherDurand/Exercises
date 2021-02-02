DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def collapse_digits(sentence)
  sentence.gsub!(/(\d)\s(?=\d)/) { $1 }
end

def format_phone_numbers(sentence)
  sentence.gsub!(/(\d\d\d)?(\d\d\d)(\d\d\d\d)/) do 
    if $1 
      "(" + $1 + ") " + $2 + "-" + $3
    else
      $2 + "-" + $3
    end
  end
end

def word_to_digit(sentence)
  DIGIT_HASH.keys.each do |word|
    sentence.gsub!(/\b#{word}\b/i, DIGIT_HASH[word])
  end
  collapse_digits(sentence)
  format_phone_numbers(sentence)
  sentence
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

