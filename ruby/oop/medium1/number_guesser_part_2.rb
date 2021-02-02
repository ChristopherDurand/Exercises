class WonGame < StandardError; end
class LostGame < StandardError; end
class GuessingGame
  def initialize(minimum, maximum)
    @min_number = minimum
    @max_number = maximum
    @max_guesses = Math.log2(max_number - min_number).to_i + 1
  end

  def play
    start
    loop do
      turn
      raise LostGame if guesses_left == 0
    end
  rescue WonGame 
    puts "That's the number.\n\nYou won!\n"
  rescue LostGame
    puts "\nYou have no more guesses. You lost!\n"
  end

  private

  attr_reader :number, :min_number, :max_number, :max_guesses
  attr_accessor :guesses_left

  def turn
    puts "You have #{guesses_left} guesses remaining."
    guess = get_guess
    raise WonGame if guess == number
    print "Your guess is too "
    puts "low." if guess < number
    puts "high." if guess > number
    self.guesses_left = guesses_left - 1
  end

  def get_guess
    print prompt
    num = gets.chomp
    until valid_guess(num)
      print "Invalid guess."
      print prompt  
      num = gets.chomp
    end
    num.to_i
  end

  def valid_guess(num)
    /^[-+]?\d+$/ =~ num && num.to_i.between?(min_number,max_number)
  end

  def prompt
    "Enter a number between #{min_number} and #{max_number}: "
  end

  def start
    @guesses_left = max_guesses
    random = Random.new
    @number = random.rand(min_number..max_number)
  end

end
game = GuessingGame.new(1,20000)
game.play
game.play