## This is the text editor interface. 
## Anything you type or change here will be seen by the other person in real time.

# Game
#   has_many :players
#   has_one :dealer
#   - play

# Player
#   has_one :hand
#   belong_to :game

# Dealer < Player
#  - deal

# Card
#   belongs_to :deck
#   suit
#   number

# Hand
#     has_many :cards
#     - value

# Deck
#  has_many :card

  
class Game
    
    attr_reader :dealer, :players
    
    def initialize(players, dealer)
        @players = players
        @dealer = dealer
    end
    
    def play
        deck = Deck.new
        ([dealer] + players).each do |p|
            p.cards = []
        end
        2.times do
            ([dealer] + players).each do |p|
                p.cards << deck.pop
            end
        end
        puts "-----"
        puts "Dealer received: #{dealer.cards} (#{dealer.value})"
        puts "-----"
        players.each do |p|
            puts ''
            puts p.name
            puts "Received: #{p.cards} (#{p.value})"
            if p.value == dealer.value
                puts 'TIE'
            else
                if p.value > dealer.value
                    puts 'WIN'
                else
                    puts 'LOSE'
                end
            end
            puts ''
        end
    end
    
end


class Player
    
    attr_reader :name
    attr_accessor :cards

    def initialize(name)
        @name = name
        @cards = []
    end
    
    def value
        temp_cards = []
        @cards.each do |card|
            temp_cards += (card == 1) ? [1,11] : [card]
        end
        potential_hands = temp_cards.combination(2).to_a
        potential_values = []
        potential_hands.each do |hand|
            potential_values << (hand.first + hand.last)
        end
        
        potential_values = potential_values.select {|h| h <= 21}
        potential_values.max
    end
    
end

class Card
    
    attr_accessor :number
    
end


class Deck
    
    attr_reader :cards
    
    def initialize
        @cards = []
        4.times do
            @cards += (1..10).to_a
            @cards += [10, 10, 10]
        end
        @cards.shuffle!
    end
    
    def pop
        @cards.pop
    end
    
end


cyrus = Player.new('Cyrus')
pablo = Player.new('Pablo')
justin = Player.new('Justin')
game = Game.new([pablo, justin], cyrus)

100.times do 
    game.play
end


