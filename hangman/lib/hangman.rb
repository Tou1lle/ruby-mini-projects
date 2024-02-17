google_words = File.readlines("google-10000-english-no-swears.txt")
hangman_words = google_words.select do | word |
  word.strip!
  (word.length >= 5 && word.length <= 12)
end

class HangmanGame 
  @@LIMIt = 9

  attr_accessor :game_ended, :number_of_tries_left, :words, :chosen_word, :hidden_word, :used_letters

  def initialize(words_for_game)
    @game_ended = false
    @number_of_tries_left = @@LIMIt
    @words = words_for_game
    @chosen_word
    @hidden_word
    @used_letters = ""
  end

  def choose_word
    self.chosen_word = self.words.sample
    self.hide_word
  end

  def hide_word 
    self.hidden_word = self.chosen_word.gsub(/[a-z]/, "_")
    self.hidden_word = self.hidden_word.split("").join(" ")
  end

  def choose_letter
    answer = gets.chomp

    while answer.length != 1
      puts "Choose 1 letter!"
      answer = gets.chomp
    end

    answer
  end

  def check_asnwer(answer)
    helper = self.hidden_word.split(" ")

    if self.chosen_word.include?(answer)

      self.chosen_word.split("").each_with_index do | letter, i |
        if self.chosen_word[i] == answer
          helper[i] = answer
        end
      end

    else 

      self.number_of_tries_left -= 1
      self.used_letters.concat(answer)

    end

    self.hidden_word = helper.join(" ")
  end

end

hangman = HangmanGame.new(hangman_words)

print "Chosen word before method: "
puts hangman.chosen_word

print "Chosen word after method: "
hangman.choose_word
puts hangman.chosen_word

print "Chosen word hidden: "
puts hangman.hidden_word

for a in 1..5 do
  answer = hangman.choose_letter
  print "Chosen letter: "
  puts answer

  print "Number of tries left: "
  puts hangman.number_of_tries_left

  hangman.check_asnwer(answer)
  print "Chosen word hidden: "
  puts hangman.hidden_word

  print "Number of tries left: "
  puts hangman.number_of_tries_left

  print "Used letters: "
  puts hangman.used_letters
end