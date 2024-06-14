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
    self.mastermind_board.gameboard.each do | row |
      if row.include?("?")
        for i in 0..3
          row[i] = answer[i]
        end

        break

      end
    end

    self.computer_player.print_hidden_code() # print for now for testing
    self.computer_player.print_secret_code() # print for now for testing
    self.mastermind_board.print_gameboard()
  end

  def check_black_rule(answer)
    right_answers = []
    secret_code = self.computer_player.secret_code
    
    for i in 0..3
      if answer[i].upcase == secret_code[i]
        right_answers.push(answer[i].upcase)
      end
    end

    right_answers
  end

  def check_white_rule(answer, wrong_answers)
    right_color = 0
    secret_code = wrong_answers.clone

    answer.each do | color |
      if secret_code.include?(color.upcase)
        right_color += 1
        secret_code.delete_at(secret_code.index(color.upcase))
      end
    end

    right_color
  end

  def result_without_correct(correct_answers, secret_code)
    code = self.computer_player.secret_code.clone

    correct_answers.each do | color |
      code.delete_at(code.index(color))
    end

    code
  end

  def answer_without_correct(answer, correct_answers)
    code = answer.clone

    correct_answers.each do | color |
      if code.index(color) == nil
        next
      else
        code.delete_at(code.index(color)) 
      end
    end

    code
  end

  def start_game()
     
    puts "Hello #{self.human_player.name}, welcome to the Mastermind console game!"
    self.computer_player.random_secret_code()
    ending_message = "YOU LOSE!"

    self.computer_player.print_hidden_code()
    self.mastermind_board.print_gameboard()

    12.times do 
      print ">> "
      answer = self.human_player.get_answer()
      self.print_answer(answer)

      right_answer = self.check_black_rule(answer)
      only_wrong_result = self.result_without_correct(right_answer, self.computer_player.secret_code)
      only_wrong_answer = self.answer_without_correct(answer, right_answer)

      print "result without correct ones: "
      p only_wrong_result

      print "answer without correct ones: "
      p only_wrong_answer

      right_color = self.check_white_rule(only_wrong_answer, only_wrong_result)

      print "the color that was answered right: " 
      p right_answer.length

      print "the number of correct color without the right ones: "
      p right_color

      print "the secret code: "
      self.computer_player.print_secret_code

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
pc_player = ComputerPlayer.new()
mastermind_board = MastermindBoard.new()
game = GameLogic.new(mastermind_board, human_player, pc_player)
game.start_game()