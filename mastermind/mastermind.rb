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

  def print_hidden_code
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

test_human = HumanPlayer.new("Tuan")

test_pc = ComputerPlayer.new()
test_pc.print_hidden_code()
test_pc.print_secret_code()

test_pc.random_secret_code
test_pc.print_secret_code

test = MastermindBoard.new()
test.print_gameboard()

answer = test_human.get_answer()