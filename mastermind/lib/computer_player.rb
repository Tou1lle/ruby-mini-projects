# Computer player generates random code for the user to guess
class ComputerPlayer
  attr_accessor :secret_code, :hidden_code

  def initialize
    @secret_code = %w[R G B Y]
    @hidden_code = ["#", "#", "#", "#"]
  end

  def print_hidden_code
    print "| "
    hidden_code.each do |code|
      print "#{code} | "
    end
    puts "\n"
  end

  def print_secret_code
    print "| "
    secret_code.each do |code|
      print "#{code} | "
    end
    puts "\n"
  end

  def random_secret_code
    self.secret_code = secret_code.map { secret_code.sample }
  end
end
