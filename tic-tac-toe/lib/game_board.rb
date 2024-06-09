# A gameboard that prints the gameboard and checks winner
class GameBoard
  attr_accessor :gameboard, :is_game_over

  WIN_CONDITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6]             # diagonal
  ]

  def initialize
    @gameboard = Array.new(9, " ")
    @is_game_over = false
  end

  def print_gameboard
    puts "\n"
    puts "#{@gameboard[0]} | #{@gameboard[1]} | #{@gameboard[2]}"
    puts "---------"
    puts "#{@gameboard[3]} | #{@gameboard[4]} | #{@gameboard[5]}"
    puts "---------"
    puts "#{@gameboard[6]} | #{@gameboard[7]} | #{@gameboard[8]}"
    puts "\n"
  end

  def check_draw
    return unless gameboard.none? { |box| box == " " }

    self.is_game_over = true
    puts "The game ended in DRAW!"
  end

  def check_win
    winner = false
    for i in 0..WIN_CONDITIONS.length - 1
      box_1 =   gameboard[WIN_CONDITIONS[i][0]]
      box_2 =   gameboard[WIN_CONDITIONS[i][1]]
      box_3 =   gameboard[WIN_CONDITIONS[i][2]]

      if box_1 != " " && box_1 == box_2 && box_1 == box_3
        self.is_game_over = true
        winner = true
      end
    end
    winner
  end
end
