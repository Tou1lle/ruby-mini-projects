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