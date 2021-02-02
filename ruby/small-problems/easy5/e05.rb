# Clean Up the Words

# Method takes string, replaces one or more
# non-alphanumeric characters in a row with whitespace.

def cleanup(sentence)
  previous_alpha = true
  sentence.chars.map do |character|
    alphabetic = /[a-zA-Z]/ =~ character ? true : false
    if !alphabetic
      if previous_alpha
        previous_alpha = false
        " "
      else
        ""
      end
    else
      previous_alpha = true
      character
    end
  end.join("")
end

print cleanup("---what's my +*& line?") == ' what s my line '