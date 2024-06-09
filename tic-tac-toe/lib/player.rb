class Player
  attr_accessor :mark, :name, :turn

  def initialize(name, mark)
    @name = name
    @mark = mark
    @turn = false
  end

  def change_turn
    self.turn = !(self.turn)
  end

  def to_s
    "Player name: #{self.name}\nPlayer mark: #{self.mark}"
  end
end