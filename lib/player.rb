class Player
  attr_reader :name, :cards

  def initialize(name = 'No Name')
    @name = name
    @cards = []
  end

  def value
    !cards.empty? && cards.all?(&:ace?) ? 12 : cards.map(&:value).inject(&:+)
  end

  # Receive one card
  def hit!(card)
    cards << card
  end

  # Empty the cards in this hand
  def reset!
    @cards = []
  end

  def output_value
    puts "#{name} received: #{cards.join(' - ')}"
    puts "value: #{value}"
  end

  def compare(oponent_value)
    case (value <=> oponent_value)
    when 1
      'WIN'
    when 0
      'TIE'
    when -1
      'LOSE'
    end
  end
end
