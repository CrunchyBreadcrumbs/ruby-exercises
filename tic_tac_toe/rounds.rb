require_relative 'player.rb'
require_relative 'grid.rb'

class Rounds
  attr_reader :player_one, :player_two, :board, :current_player
  
  def initialize
    @board = Grid.new
    @player_one = nil
    @player_two = nil
    @current_player = nil
  end

  def play
    create_players
    board.play_grid
    play_round_player
  end

  private

  def create_players
    puts "Player 1, choose a name:"
    @player_one = Player.new(gets.chomp, 'X', [])
    puts "Hello #{player_one.name}, you're playing as #{player_one.symbol}."

    puts "Player 2, choose a name:"
    @player_two = Player.new(gets.chomp, 'O', [])
    puts "Hello #{player_two.name}, you're playing as #{player_two.symbol}."
  end

  def switch_current_player(player)
    case player
    when player_one
      player_two
    else
      player_one
    end
  end

  def play_round_player
    @current_player = player_one
    until board.game_finished
      play_round(current_player, board)
      @current_player = switch_current_player(current_player)
    end
  end

  def verify(input, board)
    if input.to_i >= 1 && input.to_i <= 9 && board.taken_fields["taken_" + "#{input}"] == false then true else false end
  end

  def play_round(curr_player, board)
      puts "#{curr_player.name}, choose a position:"
      position = gets.chomp until verify(position, board) == true
      board.play_board[position] = curr_player.symbol
      board.taken_fields["taken_" + "#{position}"] = true
      curr_player.fields.push(position.to_i)
      
      board.play_grid

      if win?(curr_player)
        puts "#{curr_player.name} has won!"
        board.game_finished = true
        exit(true)
      end

      if draw?(board)
        puts "Draw!"
        board.game_finished = true
        exit(true)
      end
  end

  def win?(player)
    win_a = [1, 2, 3]
    win_b = [4, 5, 6]
    win_c = [7, 8, 9]
    win_d = [1, 4, 7]
    win_e = [2, 5, 8]
    win_f = [3, 6, 9]
    win_g = [1, 5, 9]
    win_h = [3, 5, 7]

    if (win_a - player.fields).empty? then true
    elsif (win_b - player.fields).empty? then true
    elsif (win_c - player.fields).empty? then true
    elsif (win_d - player.fields).empty? then true
    elsif (win_e - player.fields).empty? then true
    elsif (win_f - player.fields).empty? then true
    elsif (win_g - player.fields).empty? then true
    elsif (win_h - player.fields).empty? then true
    else
      false
    end
  end

  def draw?(board)
    board.taken_fields.values.all?
  end
end