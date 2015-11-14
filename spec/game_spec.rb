require_relative '../lib/game'

RSpec.describe Game do
  describe '#deal' do
    it 'gives each player two cards' do
      dealer = Player.new('dealer')
      player1 = Player.new('player1')
      player2 = Player.new('player2')
      game = described_class.new(dealer, player1, player2)
      game.deal
      expect(dealer).to have_exactly(2).cards
      expect(game.players).to all have_exactly(2).cards
    end
  end
end
