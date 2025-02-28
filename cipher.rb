# goal returns:
# > caesar_cipher("What a string!", 5)
#  => "Bmfy f xywnsl!"
require 'pry-byebug'

def ceasar_cipher(string='test', shift=0)
  # to track which characters are caps 
  is_caps_arr = string.split('').map do |letter|
    if letter.upcase == letter && letter.downcase != letter
      true
    else
      false
    end
  end

  cipher = (('a'..'z').zip(1..26)).to_h

  # letter to number
  letter_to_number_arr = string.split('').each_with_index.map do |letter, index|
    if is_caps_arr[index] == true
      cipher[letter.downcase]
    elsif cipher[letter] == nil
      letter
    else 
      cipher[letter]
    end
  end

  # transform, rightward
  cipher_num_arr = letter_to_number_arr
    .map do |num| 
      if num.class == String
        num
      elsif (num + 5) > 26
        (num + 5) - 26
      else
        num + 5
      end
    end

  # numbers back to letters
  number_to_letter_arr = cipher_num_arr.each_with_index.map do |number, index|
    if number.class == String 
      number
    elsif is_caps_arr[index] 
      cipher.key(number).upcase
    else
      cipher.key(number)
    end
  end

  number_to_letter_arr.join("")
end

puts ceasar_cipher("What a string!", 5)


