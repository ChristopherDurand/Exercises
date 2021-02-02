
class Card
  attr_reader :rank, :suit
  VALUE_MAP = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
                "7" => 7, "8" => 8, "9" => 9, "10" => 10, "jack" => 11,
                "queen" => 12, "king" => 13, "ace" => 14 }

  include Comparable

  def to_s
    "#{rank} of #{suit}"
  end

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    VALUE_MAP[rank.to_s.downcase] <=> VALUE_MAP[other.rank.to_s.downcase]
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if cards.empty?
    cards.pop
  end

  private
  attr_accessor :cards

  def reset
    self.cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank,suit)
    end
    cards.shuffle!
  end

end


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.