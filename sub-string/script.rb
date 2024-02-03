dictionary = [
    "below",
    "down",
    "go",
    "going",
    "horn",
    "how",
    "howdy",
    "it",
    "i",
    "low",
    "own",
    "part",
    "partner",
    "sit"
]

def substrings(word, array)
    found_words = array.reduce(Hash.new(0)) do | result, found_word |
        occurences = word.downcase.split(" ").count { |w| w.include?(found_word.downcase)}
        result[found_word] += occurences if occurences > 0
        result
    end
end

p substrings("Howdy partner, sit down! How's it going?", dictionary)