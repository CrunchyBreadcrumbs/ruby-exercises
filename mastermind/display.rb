# frozen_string_literal: true

module ColorableString
  RGB_COLOR_MAP = {
    blue: '98;114;164',
    green: '80;250;123',
    red: '255;85;85',
    yellow: '241;250;140',
    orange: '255;184;108',
    pink: '255;121;198',
    white: '248;248;242',
    black: '40;42;54'
  }.freeze

  refine String do
    def bg_color(color_name)
      rgb_val = RGB_COLOR_MAP[color_name]
      "\e[48;2;#{rgb_val}m#{self}\e[0m"
    end

    def fg_color(color_name)
      rgb_val = RGB_COLOR_MAP[color_name]
      "\e[38;2;#{rgb_val}m#{self}\e[0m"
    end
  end
end

class Display
  using ColorableString

  def initialize
    @round_guess = ''
  end

  def display_numbers(number)
    guess_arr = []
    number.map! do |num|
      num.to_i
      case num
      when '1'
        guess_arr.push(1)
        num.prepend(' ').concat(' ').bg_color(:red)
      when '2'
        guess_arr.push(2)
        num.prepend(' ').concat(' ').bg_color(:blue)
      when '3'
        guess_arr.push(3)
        num.prepend(' ').concat(' ').bg_color(:green)
      when '4'
        guess_arr.push(4)
        num.prepend(' ').concat(' ').bg_color(:pink)
      when '5'
        guess_arr.push(5)
        num.prepend(' ').concat(' ').bg_color(:yellow)
      when '6'
        guess_arr.push(6)
        num.prepend(' ').concat(' ').bg_color(:orange)
      else
        puts 'oops'
      end
    end
    @round_guess = number.join('  ')
    guess_arr
  end

  def display_pegs(white_amount, red_amount, counter)
    black_amount = 4 - (white_amount + red_amount)
    white = ''
    red = ''
    black = ''
    white_amount.times do
      white += "●".fg_color(:white)
    end
    red_amount.times do
      red += "●".fg_color(:red)
    end
    black_amount.times do
      black += "●".fg_color(:black)
    end
    puts "#{@round_guess}   #{red}#{white}#{black}   Guess: #{counter}/12"
  end
end
