class GameBoard
  attr_accessor :gameboard, :isGameOver

  WIN_CONDITIONS = [
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

  def check_draw()
    if self.gameboard.none? { |box| box == " " }
      self.isGameOver = true
      puts "The game ended in DRAW!"
    end
  end

  def check_win()
    winner = false
    for i in 0..WIN_CONDITIONS.length - 1 
      box_1 =   self.gameboard[WIN_CONDITIONS[i][0]]
      box_2 =   self.gameboard[WIN_CONDITIONS[i][1]]
      box_3 =   self.gameboard[WIN_CONDITIONS[i][2]]

      if (box_1 != " " && box_1 == box_2 && box_1 == box_3)
        self.isGameOver = true
        winner = true
      end
    end
    winner
  end
end