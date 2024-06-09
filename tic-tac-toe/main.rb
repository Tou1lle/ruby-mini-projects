require_relative "lib/game"
require_relative "lib/game_board"
require_relative "lib/player"

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