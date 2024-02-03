class GameBoard
  attr_accessor :gameboard

  def initialize()
    @gameboard = Array.new(9, " ")
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
  attr_accessor :mark, :name

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

gameboard = GameBoard.new()
gameboard.print_gameboard()