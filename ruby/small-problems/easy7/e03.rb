def one_word_cap(string)
  string.split.map(&:capitalize).join(" ")
end

def two_word_cap(string)
  string.split.map do |word|
    word[0].upcase + word[1,word.length].downcase
  end.join(" ")
end

def three_word_cap(string)
  i = 0
  result = ""
  while i < string.length
    if i == 0 || string[i-1] == " "
      result << string[i].upcase
    else
      result << string[i].downcase
    end
    i+=1
  end
  result
end
print word_cap('four score and seven')# == 'Four Score And Seven'
puts
print word_cap('the javaScript language') #== 'The Javascript Language'
puts
print word_cap('this is a "quoted" word')# == 'This Is A "quoted" Word'
puts
puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'