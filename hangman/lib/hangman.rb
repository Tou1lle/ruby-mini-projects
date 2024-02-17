google_words = File.readlines("google-10000-english-no-swears.txt")
hangman_words = google_words.select do | word |
  word.strip!
  (word.length >= 5 && word.length <= 12)
end