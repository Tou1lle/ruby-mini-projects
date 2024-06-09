# The game contains logic for selecting place on the gamboard
class Game
  attr_accessor :board, :player1, :player2, :players

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
  end

  def run
    board.print_gameboard
    select_place
  end

  def select_place
    until board.isGameOver
      player_on_turn_arr = players.select { |player| player.turn == true }
      player_on_turn = player_on_turn_arr[0]
      puts player_on_turn
      puts "Choose a box to place your #{player_on_turn.mark}"
      print ">> "
      box = gets.chomp

      if box.to_i == 0 || box.to_i > 9
        puts "\n!!! The number must be between 1 - 9 included !!!\n\n"
        next
      end

      if board.gameboard[box.to_i - 1] != " "
        puts "\n!!! You must choose a blank box !!!\n\n"
        next
      end

      board.gameboard[box.to_i - 1] = player_on_turn.mark

      players.each { |player| player.change_turn }

      board.print_gameboard

      puts "The Winner is #{player_on_turn.name}" if board.check_win

      board.check_draw
    end
  end
end
