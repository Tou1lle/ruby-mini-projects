class Game
  attr_accessor :board, :player1, :player2, :players

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
  end

  def run()
    self.board.print_gameboard()
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

      if self.board.check_win()
        puts "The Winner is #{player_on_turn.name}"
      end

      self.board.check_draw()
    end
  end
end