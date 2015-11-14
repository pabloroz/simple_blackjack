require_relative '../lib/card'

class Deck
  attr_reader :cards

  RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K).freeze
  SUITS = %w(Spades Hearts Diamonds Clubs).freeze

  def initialize
    @cards = SUITS.product(RANKS).map { |suit, rank| Card.new(suit, rank) }
  end

  def shuffle!
    cards.shuffle!
  end

  def shift
    cards.shift
  end
end
