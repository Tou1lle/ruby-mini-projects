class MastermindBoard 
  attr_accessor :gameboard

  def initialize()
    @gameboard = Array.new(12) {Array.new(4, "?")}
  end

  def print_gameboard() 
    puts "-----------------"
    self.gameboard.reverse_each do |row|
      puts "| " + row.join(" | ") + " |"
      puts "-----------------"
    end
  end
end

class ComputerPlayer
  attr_accessor :secret_code, :hidden_code

  def initialize()
    @secret_code = ["R", "G", "B", "Y"]
    @hidden_code = ["#", "#", "#", "#"]
  end

  def print_hidden_code()
    print "| "
    self.hidden_code.each do |code|
      print code + " | "
    end
    puts "\n"
  end

  def print_secret_code()
    print "| "
    self.secret_code.each do |code|
      print code + " | "
    end
    puts "\n"
  end

  def random_secret_code()
    self.secret_code = self.secret_code.map do | code |
      code = self.secret_code.sample()
    end
  end
end

class HumanPlayer
  attr_accessor :name, :answer

  def initialize(name)
    @name = name
    @answer = []
  end

  def get_answer()
    answer = gets
    answer_array = answer.split(" ")
    answer_array = answer_array.map { |color| color.upcase}
      while answer_array.length != 4
        puts "You have to write 4 letter representing color in format : R G B Y"
        answer = gets
        answer_array = answer.split(" ")
        answer_array = answer_array.map { |color| color.upcase}
      end
    answer_array
  end
end

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
    ending_message = ""

    self.computer_player.print_hidden_code()
    self.mastermind_board.print_gameboard()

    12.times do 
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
    end
  end 
end

human_player = HumanPlayer.new("Tuan")

pc_player = ComputerPlayer.new()
#pc_player.print_hidden_code()
# pc_player.print_secret_code()

#pc_player.random_secret_code
#pc_player.print_secret_code

mastermind_board = MastermindBoard.new()
#mastermind_board.print_gameboard()

#answer = human_player.get_answer()

game = GameLogic.new(mastermind_board, human_player, pc_player)
#game.print_answer(answer)

#right_answer = game.check_black_rule(answer)
#only_wrong_result = game.result_without_correct(right_answer, pc_player.secret_code)
#only_wrong_answer = game.answer_without_correct(answer, right_answer)

#print "result without correct ones: "
#p only_wrong_result

#print "answer without correct ones: "
#p only_wrong_answer

#right_color = game.check_white_rule(only_wrong_answer, only_wrong_result)

#print "the color that was answered right: " 
#p right_answer

#print "the number of correct color without the right ones: "
#p right_color

#print "the secret code: "
#pc_player.print_secret_code

game.start_game()