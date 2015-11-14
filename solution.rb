require './lib/player'
require './lib/game'

cyrus = Player.new('Cyrus')
pablo = Player.new('Pablo')
justin = Player.new('Justin')
game = Game.new(cyrus, pablo, justin)

100.times { game.play }
