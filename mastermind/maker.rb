# frozen_string_literal: true

class Maker < Breaker
  NUM_COLOURS = [1, 2, 3, 4, 5, 6].freeze
  POSSIBLE_CODES = NUM_COLOURS.repeated_permutation(4).to_a

  def initialize
    super
    @reduced_codes = NUM_COLOURS.repeated_permutation(4).to_a
  end

  def play_maker
    comp_guess = create_algo_guess
    sleep 0.5
    compare_guess(@display.display_numbers(comp_guess.join.to_s.split('')))
    remove_guess(comp_guess)
  end

  def create_user_code
    loop do
      @code = gets.chomp.split('')
      next unless check_input?(@code)

      @code.map! do |n|
        n.to_i
      end
      break
    end
  end

  def create_algo_guess
    if @guess_counter.zero?
      [1, 1, 2, 2]
    else
      @reduced_codes[0]
    end
  end

  def remove_guess(guess)
    POSSIBLE_CODES.each do |code_n|
      peg_red = 0
      matches = (guess & code_n).flat_map { |n| [n] * [guess.count(n), code_n.count(n)].min }
      match_count = matches.count
      code_n.each_with_index do |number, m|
        peg_red += 1 if number == guess[m]
      end
      peg_white = match_count - peg_red
      @reduced_codes.delete(code_n) unless peg_white == @white_pegs && peg_red == @red_pegs
    end
  end
end
