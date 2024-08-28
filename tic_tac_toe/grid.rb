class Grid
  attr_accessor :play_board, :taken_fields, :game_finished

  def initialize()
    @play_board = {
    "1" => " ",
    "2" => " ",
    "3" => " ",
    "4" => " ",
    "5" => " ",
    "6" => " ",
    "7" => " ",
    "8" => " ",
    "9" => " ",
    
    }
    @taken_fields = {
    "taken_1" => false,
    "taken_2" => false,
    "taken_3" => false,
    "taken_4" => false,
    "taken_5" => false,
    "taken_6" => false,
    "taken_7" => false,
    "taken_8" => false,
    "taken_9" => false,
    }

    @game_finished = false
  end

  def play_grid
    puts "----------"
    puts "Positions:      Play Board:"
    space_line = Array.new(3, '   ').join('|')
    space_row = Array.new(2, space_line).join('     ') << "\n"
    separator_line = Array.new(3, '___').join('|')
    separator_row = Array.new(2, separator_line).join('     ') << "\n"
    play_row_1 = [" #{@play_board["1"]} ", " #{@play_board["2"]} ", " #{@play_board["3"]} "].join('|')
    play_row_2 = [" #{@play_board["4"]} ", " #{@play_board["5"]} ", " #{@play_board["6"]} "].join('|')
    play_row_3 = [" #{@play_board["7"]} ", " #{@play_board["8"]} ", " #{@play_board["9"]} "].join('|')
    number_row_1 = [" 1 ", " 2 ", " 3 "].join('|')
    number_row_2 = [" 4 ", " 5 ", " 6 "].join('|')
    number_row_3 = [" 7 ", " 8 ", " 9 "].join('|')
    input_row_1 = number_row_1 + '     ' + play_row_1  + "\n"
    input_row_2 = number_row_2 + '     ' + play_row_2  + "\n"
    input_row_3 = number_row_3 + '     ' + play_row_3  + "\n"
    row_1 = [space_row, input_row_1] << separator_row
    row_2 = [space_row, input_row_2] << separator_row
    row_3 = [space_row, input_row_3] << space_row
    grid = [row_1, row_2, row_3]
    puts grid
  end
end