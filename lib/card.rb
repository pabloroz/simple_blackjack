class Card
  attr_reader :suit, :rank

  FACECARDS = %w(J Q K).freeze

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ace?
    rank == 'A'
  end

  def value
    value = rank
    value = 10 if FACECARDS.include?(rank)
    value = 11 if ace?
    value.to_i
  end

  def to_s
    "#{rank}-#{suit[0].upcase}"
  end
end
