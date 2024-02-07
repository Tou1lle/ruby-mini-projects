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
      while answer_array.length != 4
        puts "You have to write 4 letter representing color in format : R G B Y"
        answer = gets
        answer_array = answer.split(" ")
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
    right_answers = 0
    secret_code = self.computer_player.secret_code
    
    for i in 0..3
      if answer[i].upcase == secret_code[i]
        right_answers += 1
      end
    end

    right_answers
  end

  def check_white_rule(answer)
    right_color = 0
    secret_code = self.computer_player.secret_code.clone

    answer.each do | color |
      if secret_code.include?(color.upcase)
        right_color += 1
        secret_code.delete_at(secret_code.index(color.upcase))
      end
    end

    right_color
  end
end

test_human = HumanPlayer.new("Tuan")

test_pc = ComputerPlayer.new()
test_pc.print_hidden_code()
test_pc.print_secret_code()

test_pc.random_secret_code
test_pc.print_secret_code

test_board = MastermindBoard.new()
test_board.print_gameboard()

answer = test_human.get_answer()

game = GameLogic.new(test_board, test_human, test_pc)
game.print_answer(answer)

right_answer = game.check_black_rule(answer)
right_color = game.check_white_rule(answer)
p right_answer
p right_color
test_pc.print_secret_code