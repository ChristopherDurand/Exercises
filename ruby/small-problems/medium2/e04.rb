ERROR = "bad_state"
def state(tokens)
  tokens.map { |info| [info[:chars][0], info[:count]] }.to_h
end

def initialize_tokens
  [ { count: 0, ordered: true, chars:  ["(", ")"] },
    { count: 0, ordered: true, chars:  ["[", "]"] },
    { count: 0, ordered: true, chars:  ["{", "}"] },
    { count: 0, ordered: false, chars: ['"', '"'] },
    { count: 0, ordered: false, chars: ["'", "'"] } ]
end

def bad_state?(stack, char)
  return true if stack[-1][char] < 0
  last = last_increment(stack, char)
  if last
    stack[-1].any? { |char, count| count != last[char] }
  else
    true
  end
end

def last_increment(stack, char)
  stack[0..-2].reverse.find do |state|
    state[char] == stack[-1][char]
  end
end

def ordered_check!(match_stack, char, info, tokens)
  if char == info[:chars][0]
    info[:count] += 1
    match_stack << state(tokens)
  end
  if char == info[:chars][1]
    info[:count] -= 1
    match_stack << state(tokens)
    if bad_state?(match_stack, info[:chars][0])
      match_stack << ERROR
    end
  end
  match_stack << ERROR if info[:count] < 0 
end
def unordered_check!(match_stack, char, info, tokens)
  if char == info[:chars][0]
    if info[:count].even?
      info[:count] += 1
      match_stack << state(tokens)
    else
      info[:count] -= 1
      match_stack << state(tokens)
      match_stack << ERROR if bad_state?(match_stack, info[:chars][0])
    end
  end
end

def no_errors?(match_stack)
  match_stack[-1] != ERROR
end

def balanced?(str)
  tokens = initialize_tokens 
  match_stack = [state(tokens)]

  str.each_char do |char|
    tokens.each do |info|
      if info[:ordered]
        ordered_check!(match_stack, char, info, tokens)
      else #Not Ordered
        unordered_check!(match_stack, char, info, tokens)
      end
    end
    break if match_stack[-1] == ERROR
  end
  no_errors?(match_stack)
end

#puts balanced?("(([)(]))")
  
puts balanced?('What (is) this?') #== true
puts balanced?('What i)(s) this?') #== false
puts balanced?('Wh{at [(is} this]?') #== false
puts balanced?('((What) (is this))?') #== true
puts balanced?('((What)) (is this))?') #== false
puts balanced?('H\'e\'y!') #== true
puts balanced?(')Hey!(') # == false
puts balanced?('What ((is))) up(') #== false
puts balanced?("(a(b(c{d[e]f}g)))")
puts balanced?("{(})")
puts balanced? ("))")
puts balanced? "\"(\")"
