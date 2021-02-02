INVALID_TOKEN = "IT"
END_OF_STACK = "EOS"

def validate(register, stack, &operator)
  if stack.empty?
    END_OF_STACK
  elsif operator
    operator.call(register,stack.pop)
  else 
    stack.pop
  end
end
def errors(register)
  if register == END_OF_STACK
    puts "ERROR: END OF STACK REACHED"
    true
  elsif register == INVALID_TOKEN
    puts "ERROR: INVALID TOKEN"
    true
  else
    false
  end
end 
def check(instruction)
  if instruction.to_i.to_s == instruction
    instruction.to_i
  else
    INVALID_TOKEN
  end
end
def minilang(program)
  program = program.split(" ")
  register = 0
  stack = []
  program.each do |instruction|
    case instruction
    when "PUSH"
      stack.push(register)
    when "ADD"
      register = validate(register, stack, &:+)
    when "SUB"
      register = validate(register, stack, &:-)
    when "MULT"
      register = validate(register, stack, &:*)
    when "DIV"
      register = validate(register, stack, &:/)
    when "MOD"
      register = validate(register, stack, &:%)
    when "POP"
      register = validate(register, stack, nil)
    when "PRINT"
      puts register
    else # Otherwise it's an integer, push it to the stack
      register = check(instruction)
    end
    break if errors(register)
  end
end

#minilang('5 PUSH 3 MULT PRINT')
#minilang('5 PRINT PUSH 3 PRINT ADD PRINT')

minilang('3 PUSH 5 MOD MOD PRINT')
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
