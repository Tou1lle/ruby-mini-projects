# string to int -> #codepoints
# int to string -> #chr
# a = 97, A = 65
# z = 122, Z = 90

=begin
 this methods is responsible for ciphering the string with the key
 key is int
=end
def caesar_cipher(string, key)
    string_codepoints = string.codepoints

    codepoints_with_key = increment_codepoint(string_codepoints, key)

    ciphred_key = codepoints_with_key.map { |n| n.chr}
    ciphred_key.join
end


# increment the codepoint value by the key
def increment_codepoint(array, key) 
    incremented_array = []

    array.each do | codepoint |
        if !(codepoint.between?(65, 90) || codepoint.between?(97, 122))
            incremented_array.push(codepoint)
        else
            for i in 1..key
                codepoint += 1
                codepoint = check_overlap(codepoint)
                incremented_array.push(codepoint) if i == key
            end
        end
    end

    incremented_array
end


# Check if the value is is in the alphabet
def check_overlap(codepoint)
    if codepoint == 123
        return 97
    elsif codepoint == 91
        return 65
    else
        return codepoint
    end
end

puts caesar_cipher("What a string!", 5)