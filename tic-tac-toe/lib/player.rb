# A player
class Player
  attr_accessor :mark, :name, :turn

  def initialize(name, mark)
    @name = name
    @mark = mark
    @turn = false
  end

  def change_turn
    self.turn = !turn
  end

  def to_s
    "Player name: #{name}\nPlayer mark: #{mark}"
  end
end
