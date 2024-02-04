class GameBoard
  attr_accessor :gameboard, :isGameOver

  @@WIN_CONDITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6]             # diagonal
  ]

  def initialize()
    @gameboard = Array.new(9, " ")
    @isGameOver = false
  end

  def print_gameboard()
    puts "\n"
    puts "#{@gameboard[0]} | #{@gameboard[1]} | #{@gameboard[2]}"
    puts '---------'
    puts "#{@gameboard[3]} | #{@gameboard[4]} | #{@gameboard[5]}"
    puts '---------'
    puts "#{@gameboard[6]} | #{@gameboard[7]} | #{@gameboard[8]}"
    puts "\n"
  end
end

class Player
  attr_accessor :mark, :name, :turn

  def initialize(name, mark)
    @name = name
    @mark = mark
    @turn = false
  end
end

class Game
  attr_accessor :board, :player1, :player2

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def run()
    @board.print_gameboard
    select_place(2)
    @board.print_gameboard
    select_place(6)
    @board.print_gameboard
  end

  def select_place(index) 
    @board.gameboard[index] = "X"
  end
end



playerX = Player.new("Black", "X")
player0 = Player.new("Niger", "O")
gameboard = GameBoard.new()

game = Game.new(gameboard, playerX, player0)
game.run()