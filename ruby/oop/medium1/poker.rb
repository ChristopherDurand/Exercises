
class Card
  attr_reader :rank, :suit
  VALUE_MAP = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
                "7" => 7, "8" => 8, "9" => 9, "10" => 10, "jack" => 11,
                "queen" => 12, "king" => 13, "ace" => 14 }

  include Comparable

  def to_s
    "#{rank} of #{suit}"
  end

  def to_i
    VALUE_MAP[rank.to_s.downcase]
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
  alias_method :pop, :draw
  private
  attr_accessor :cards

  def reset
    self.cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank,suit)
    end
    cards.shuffle!
  end
end


class PokerHand
  def initialize(deck)
    @cards = []
    5.times { cards << deck.pop }
    @cards.sort!
  end

  def print
    puts cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_accessor :cards

  def suit_histogram
    Deck::SUITS.map do |suit|
      [suit, cards.count { |card| card.suit == suit }]
    end.to_h
  end

  def rank_histogram
    Deck::RANKS.map do |rank|
      [rank, cards.count { |card| card.rank == rank }]
    end.to_h
  end

  def royal_flush?
    straight? && flush? && rank_histogram["Ace"] == 1
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    Deck::RANKS.any? { |rank| cards.count { |card| card.rank == rank } == 4}
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    Deck::SUITS.any? { |suit| cards.count { |card| card.suit == suit} == 5}
  end

  def straight?
    0.upto(3).all? { |n| cards[n+1].to_i-cards[n].to_i == 1 }
  end

  def three_of_a_kind?
    Deck::RANKS.any? { |rank| cards.count { |card| card.rank == rank } == 3}
  end

  def two_pair?
    Deck::RANKS.count { |rank| cards.count { |card| card.rank == rank } == 2} == 2
  end

  def pair?
    Deck::RANKS.any? { |rank| cards.count { |card| card.rank == rank } == 2}
  end
end
deck = Deck.new
hand = PokerHand.new(deck)
hand.print


hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts
hand.print
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'