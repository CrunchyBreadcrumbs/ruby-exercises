# frozen_string_literal: true

require_relative 'text'

class Game
  include Text
  def initialize
    @current_mode = nil
  end

  def start_game
    Text.show_introduction
    choose_mode
    check_game_end
  end

  def choose_mode
    Text.show_choose_message
    number = gets.chomp
    case number.to_i
    when 1
      play_breaker
    when 2
      play_maker
    else
      puts 'Bye!'
      exit
    end
  end

  def play_breaker
    @breaker = Breaker.new
    @current_mode = @breaker
    @breaker.create_code
    Text.breaker_start_message
    @breaker.guess_breaker until @breaker.game_over
  end

  def play_maker
    @maker = Maker.new
    @current_mode = @maker
    Text.maker_start_message
    @maker.create_user_code
    @maker.play_maker until @maker.game_over
  end

  def check_game_end
    if @current_mode.win
      Text.win_message
    else
      Text.lost_message
    end
    repeat_game
  end

  def repeat_game
    Text.show_repeat
    if gets.chomp == 'y'
      choose_mode
      check_game_end
    end
    puts 'Thanks for playing!'
    exit
  end
end
