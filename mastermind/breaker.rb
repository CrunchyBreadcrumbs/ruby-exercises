# frozen_string_literal: true

require_relative 'text'

class Breaker
  attr_reader :code, :win, :game_over, :guess_counter

  include Text

  def initialize
    @code = []
    @display = Display.new
    @win = false
    @game_over = false
    @guess_counter = 0
    @red_pegs = 0
    @white_pegs = 0
  end

  def create_code
    4.times do
      @code.push(rand(1..6))
    end
  end

  def guess_breaker
    loop do
      input = gets.chomp.split('')
      if check_input?(input)
        compare_guess(@display.display_numbers(input))
        break
      end
    end
  end

  def compare_guess(guess)
    @guess_counter += 1
    matches = (@code & guess).flat_map { |n| [n] * [@code.count(n), guess.count(n)].min }
    match_amount = matches.count
    if matches.empty?
      @display.display_pegs(0, 0, @guess_counter)
      @red_pegs = 0
      @white_pegs = 0
      check_game_state?(0)
    else
      check_position(guess, match_amount)
    end
  end

  def check_position(guess, match_amount)
    correct_pos = 0
    @code.each_with_index do |number, n|
      correct_pos += 1 if number == guess[n]
    end
    @display.display_pegs(match_amount - correct_pos, correct_pos, @guess_counter)
    @red_pegs = correct_pos
    @white_pegs = match_amount - correct_pos
    check_game_state?(correct_pos)
  end

  def check_game_state?(correct)
    if correct == 4
      @win = true
      @game_over = true
    elsif @guess_counter >= 12
      Text.show_code(@code)
      @game_over = true
    end
  end

  def check_input?(guess_input)
    unless guess_input.length == 4
      Text.show_wrong_input_length
      return false
    end
    guess_input.each do |m|
      unless m.to_i.between?(1, 6)
        Text.show_wrong_numbers
        return false
      end
    end
    true
  end
end
