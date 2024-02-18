require "json"

google_words = File.readlines("google-10000-english-no-swears.txt")
hangman_words = google_words.select do | word |
  word.strip!
  (word.length >= 5 && word.length <= 12)
end

class HangmanGame 
  @@LIMIT = 9

  attr_accessor :game_ended, :number_of_tries_left, :words, :chosen_word, :hidden_word, :used_letters

  def initialize(words_for_game)
    @game_ended = false
    @number_of_tries_left = @@LIMIT
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
    if self.hidden_word.include?(answer) || self.used_letters.include?(answer)
      puts "\n"
      puts "!! You already guessed this letter !!"
      return
    end

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

  def check_won_game
    !self.hidden_word.include?("_")
  end

  def save_game_to_json
    JSON.dump({
      :game_ended => @game_ended,
      :number_of_tries_left => @number_of_tries_left,
      :chosen_word => @chosen_word,
      :hidden_word => @hidden_word,
      :used_letters => @used_letters
    })
  end

  def save_game_to_file(string_json)
    File.open("hangman_game.json", "w") do |file|
      file.write(string_json)
    end
  end

  def play_game
    self.choose_word()
    print "The secret word is: "
    puts self.chosen_word + "\n"
    ending_message = "You didn't guess the word, you lost!"

    while self.game_ended == false
      if self.check_won_game
        ending_message = "You guessed the word! You won!"
        self.game_ended == true
        break
      end

      if number_of_tries_left == 0
        self.game_ended == true
        break
      end

      print "Number of lives left: "
      puts self.number_of_tries_left

      print "Used letters: "
      puts self.used_letters

      print "The hidden word: "
      puts self.hidden_word

      print "Do you want to save the game? (y/n): "
      save_game_answer = gets.chomp

      if save_game_answer == "y"
        saved_game = self.save_game_to_json
        self.save_game_to_file(saved_game)
      end

      print "Guess a letter: "
      answer = self.choose_letter
      self.check_asnwer(answer)
      puts "\n"
    end

    puts ending_message
  end
end

hangman = HangmanGame.new(hangman_words)
hangman.play_game()