class EmptyStackError < StandardError; end
class InvalidTokenError < StandardError; end
class Minilang
  def initialize(program)
    @program = program.split(" ")
    @register = 0
    @stack = []
  end

  def eval
    program.each do |instruction|
      execute(instruction)
    end  
  rescue EmptyStackError => e
    puts e
  
  rescue InvalidTokenError => e
    puts e

  end

  private

  def validate(&operator)
    if stack.empty?
      raise EmptyStackError, "Empty Stack!"
    elsif operator
      operator.call(register,stack.pop)
    else 
      stack.pop
    end
  end

  def check(instruction)
    if instruction.to_i.to_s == instruction
      instruction.to_i
    else
      raise InvalidTokenError, "Invalid Token: #{instruction}"
    end
  end

  def execute(instruction)
    case instruction
      when "PUSH"
        stack.push(register)
      when "ADD"
        self.register = validate(&:+)
      when "SUB"
        self.register = validate(&:-)
      when "MULT"
        self.register = validate(&:*)
      when "DIV"
        self.register = validate(&:/)
      when "MOD"
        self.register = validate(&:%)
      when "POP"
        self.register = validate
      when "PRINT"
        puts register
      else # Otherwise it's an integer, push it to the stack
        self.register = check(instruction)
    end
  end

  attr_accessor :program, :register, :stack
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)