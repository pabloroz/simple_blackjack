require './lib/deck'

class Game
  attr_reader :dealer, :players

  def initialize(dealer, *players)
    @dealer = dealer
    @players = players
  end

  def play
    reset_players
    deal
    output_results
  end

  def reset_players
    all_players.each(&:reset!)
  end

  def deal
    deck = Deck.new
    deck.shuffle!
    2.times { all_players.each { |p| p.hit!(deck.shift) } }
  end

  def output_results
    puts '---------'
    output_dealer
    puts 'PLAYERS'
    output_players
    puts '---------'
  end

  private

  def all_players
    [dealer] + players
  end

  def output_dealer
    puts 'DEALER'
    dealer.output_value
    puts ''
  end

  def output_players
    players.each do |p|
      puts ''
      p.output_value
      puts p.compare(dealer.value)
    end
  end
end
