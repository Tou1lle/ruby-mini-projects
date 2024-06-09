# string to int -> #codepoints
# int to string -> #chr
# a = 97, A = 65
# z = 122, Z = 90

#  this methods is responsible for ciphering the string with the key
#  key is int
def caesar_cipher(string, key)
  string_codepoints = string.codepoints

  codepoints_with_key = increment_codepoint(string_codepoints, key)

  ciphred_key = codepoints_with_key.map(&:chr)
  ciphred_key.join
end

# increment the codepoint value by the key
def increment_codepoint(array, key)
  incremented_array = []

  array.each do |codepoint|
    if codepoint.between?(65, 90) || codepoint.between?(97, 122)
      (1..key).each do |n|
        codepoint += 1
        codepoint = check_overlap(codepoint)
        incremented_array.push(codepoint) if n == key
      end
    else
      incremented_array.push(codepoint)
    end
  end

  incremented_array
end

# Check if the value is is in the alphabet
def check_overlap(codepoint)
  if codepoint == 123
    97
  elsif codepoint == 91
    65
  else
    codepoint
  end
end

puts caesar_cipher("What a string!", 1)
