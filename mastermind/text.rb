# frozen_string_literal: true

module Text
  def self.show_introduction
    introduction_text = <<~HEREDOC
      Hello!

      Mastermind Gamerules
      ---------------
      Version Breaker:
      The computer generates a code of 4 numbers, each ranging between 1-6.
      You have 12 tries to guess the code and you will receive feedback after each guess.
      Black circle = No match
      White circle = Correct number in wrong position
      Red circle = Correct number in correct position
      The order of the circles do no match the position of the guesses.

      Version Maker:
      Input a code of 4 numbers, each ranging between 1-6.
      The computer will try to guess your code.
      ---------------
    HEREDOC
    puts introduction_text
  end

  def self.show_choose_message
    puts ''
    puts 'Type 1 for Breaker'
    puts 'Type 2 for Maker'
    puts 'Press any other key to quit.'
    puts '-----'
  end

  def self.breaker_start_message
    puts 'Type 4 numbers, each between 1-6:'
  end

  def self.maker_start_message
    puts 'Type a code of 4 numbers ranging between 1-6 for the computer to guess.'
  end

  def self.win_message
    puts 'The code is cracked!'
  end

  def self.lost_message
    puts 'Out of turns :('
  end

  def self.show_code(code)
    puts "The code was #{code}."
  end

  def self.invalid_guess_message
    puts 'Please only include four numbers with each ranging between 1-6.'
  end

  def self.show_wrong_input_length
    puts 'Make sure your guess is 4 numbers long.'
  end

  def self.show_wrong_numbers
    puts 'Only include numbers between 1-6.'
  end

  def self.show_repeat
    puts 'Would you like to repeat the game?'
    puts 'Press y to continue, any other key to quit.'
  end
end
