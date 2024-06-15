require_relative "lib/mastermind_board"
require_relative "lib/human_player"
require_relative "lib/computer_player"

# GameLogic starts the game and checks the answers of the player vs the pc code
class GameLogic
  attr_accessor :mastermind_board, :human_player, :computer_player, :endgame

  def initialize(gameboard, human, computer)
    @mastermind_board = gameboard
    @human_player = human
    @computer_player = computer
    @endgame = false
  end

  def print_answer(answer)
    mastermind_board.gameboard.each do |row|
      if row.include?("?")
        (0..3).each { |i| row[i] = answer[i] }
        break
      end
    end

    computer_player.print_hidden_code # print for now for testing
    computer_player.print_secret_code # print for now for testing
    mastermind_board.print_gameboard
  end

  def check_black_rule(answer)
    right_answers = []
    secret_code = computer_player.secret_code

    (0..3).each do |i|
      right_answers.push(answer[i].upcase) if answer[i].upcase == secret_code[i]
    end

    right_answers
  end

  def check_white_rule(answer, wrong_answers)
    right_color = 0
    secret_code = wrong_answers.clone

    answer.each do |color|
      if secret_code.include?(color.upcase)
        right_color += 1
        secret_code.delete_at(secret_code.index(color.upcase))
      end
    end

    right_color
  end

  def result_without_correct(correct_answers, _)
    code = computer_player.secret_code.clone

    correct_answers.each do |color|
      code.delete_at(code.index(color))
    end

    code
  end

  def answer_without_correct(answer, correct_answers)
    code = answer.clone

    correct_answers.each do |color|
      next if code.index(color).nil?

      code.delete_at(code.index(color))
    end

    code
  end

  def start_game
    puts "Hello #{human_player.name}, welcome to the Mastermind console game!"
    computer_player.random_secret_code
    ending_message = "YOU LOSE!"

    computer_player.print_hidden_code
    mastermind_board.print_gameboard

    12.times do
      print ">> "
      answer = human_player.answer
      print_answer(answer)

      right_answer = check_black_rule(answer)
      only_wrong_result = result_without_correct(right_answer, computer_player.secret_code)
      only_wrong_answer = answer_without_correct(answer, right_answer)

      print "result without correct ones: "
      p only_wrong_result

      print "answer without correct ones: "
      p only_wrong_answer

      right_color = check_white_rule(only_wrong_answer, only_wrong_result)

      print "the color that was answered right: "
      p right_answer.length

      print "the number of correct color without the right ones: "
      p right_color

      print "the secret code: "
      computer_player.print_secret_code

      if right_answer.length == 4
        ending_message = "YOU WIN!"
        break
      end
    end

    puts ending_message
    puts "GAME OVER"
  end
end

human_player = HumanPlayer.new("Tuan")
pc_player = ComputerPlayer.new
mastermind_board = MastermindBoard.new
game = GameLogic.new(mastermind_board, human_player, pc_player)
game.start_game
