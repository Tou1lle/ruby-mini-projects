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

  def change_turn
    self.turn = !(self.turn)
  end

  def to_s
    "Player name: #{self.name}\nPlayer mark: #{self.mark}"
  end
end

class Game
  attr_accessor :board, :player1, :player2, :players

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @players = [@player1, player2]
  end

  def run()
    self.board.print_gameboard
    self.select_place()
  end

  def select_place() 
    while !(self.board.isGameOver) do
      player_on_turn_arr = self.players.select { | player | player.turn == true } 
      player_on_turn = player_on_turn_arr[0]
      puts player_on_turn
      puts "Choose a box to place your #{player_on_turn.mark}"
      print ">> "
      box = gets.chomp

      if box.to_i == 0 || box.to_i > 9
        puts "\n!!! The number must be between 1 - 9 included !!!\n\n"
        next
      end

      if self.board.gameboard[box.to_i - 1] != " "
        puts "\n!!! You must choose a blank box !!!\n\n"
        next
      end

      self.board.gameboard[box.to_i - 1] = player_on_turn.mark

      self.players.each { | player | player.change_turn }

      self.board.print_gameboard
    end
  end
end


puts "Hello Player 1. What is your name?"
print ">> "
player_x_name = gets.chomp
puts "Hello Player 2. What is your name?"
print ">> "
player_o_name = gets.chomp
playerX = Player.new(player_x_name, "X")
playerX.turn = true
player0 = Player.new(player_o_name, "O")

gameboard = GameBoard.new()

game = Game.new(gameboard, playerX, player0)
game.run()