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