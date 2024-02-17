google_words = File.readlines("google-10000-english-no-swears.txt")
hangman_words = google_words.select do | word |
  word.strip!
  (word.length >= 5 && word.length <= 12)
end

class HangmanGame 
  @@LIMIt = 9

  attr_accessor :game_ended, :number_of_tries, :words, :chosen_word, :hidden_word

  def initialize(words_for_game)
    @game_ended = false
    @number_of_tries_left = @@LIMIt
    @words = words_for_game
    @chosen_word
    @hidden_word
  end

  def choose_word
    self.chosen_word = self.words.sample
    self.hide_word
  end

  def hide_word 
    self.hidden_word = self.chosen_word.gsub(/[a-z]/, "_")
    self.hidden_word = self.hidden_word.split("").join(" ")
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