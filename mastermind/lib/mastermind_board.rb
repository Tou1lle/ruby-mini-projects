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