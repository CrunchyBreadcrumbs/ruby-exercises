# frozen_string_literal: true

require_relative 'breaker'
require_relative 'display'
require_relative 'game'
require_relative 'maker'
require_relative 'text'

def play_game
  game = Game.new
  game.start_game
end

play_game
