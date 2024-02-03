class GameBoard
  attr_accessor :gameboard

  def initialize()
    @gameboard = Array.new(9, "#")
  end

  def print_gameboard()
    self.gameboard.each_with_index do | el, index |
      
      if index == 3 || index == 6
        puts 
      end

      print el + " "

      puts if index == 8
    end
  end
end

gameboard = GameBoard.new()
gameboard.print_gameboard()