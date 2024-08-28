require_relative 'player.rb'
require_relative 'grid.rb'
require_relative 'rounds.rb'

def play_game
  game = Rounds.new
  game.play
end

play_game