class WonGame < StandardError; end
class LostGame < StandardError; end
class GuessingGame
  MAX_GUESSES = 7
  MIN_NUMBER = 1
  MAX_NUMBER = 100

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

  attr_reader :number
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
    /^[-+]?\d+$/ =~ num && num.to_i.between?(MIN_NUMBER,MAX_NUMBER)
  end

  def prompt
    "Enter a number between #{MIN_NUMBER} and #{MAX_NUMBER}: "
  end

  def start
    @guesses_left = MAX_GUESSES
    random = Random.new
    @number = random.rand(1..100)
  end

end
game = GuessingGame.new
game.play
game.play