# Human player represents the user
# Users write their answers to the console
class HumanPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
    @answer = []
  end

  def answer
    answer = gets
    answer_array = answer.split
    answer_array = answer_array.map(&:upcase)
    while answer_array.length != 4
      puts "You have to write 4 letter representing color in format : R G B Y"
      answer = gets
      answer_array = answer.split
      answer_array = answer_array.map(&:upcase)
    end
    answer_array
  end
end
