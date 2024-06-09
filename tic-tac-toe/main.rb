require_relative "lib/game"
require_relative "lib/game_board"
require_relative "lib/player"

puts "Hello Player 1. What is your name?"
print ">> "
player_x_name = gets.chomp

puts "Hello Player 2. What is your name?"
print ">> "
player_o_name = gets.chomp

player_x = Player.new(player_x_name, "X")
player_x.turn = true
player_o = Player.new(player_o_name, "O")

gameboard = GameBoard.new

game = Game.new(gameboard, player_x, player_o)
game.run
