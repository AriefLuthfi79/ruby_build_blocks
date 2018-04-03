module CaesarCipher
  def caesar_chipher(str, shift)
    character = []
    str.each_char do |char|
      ascii = char.ord
      if (65..90).include?(ascii)
        if ascii + shift > 90
          new_shifts = ascii + shift
          char_changed = 65 + (new_shifts - 90)
          character << char_changed.chr
        else
          new_shifts = ascii + shift
          character << new_shifts.chr
        end
      elsif (97..122).include?(ascii)
        if ascii + shift > 122
          new_shifts = ascii + shift
          char_changed = 97 + (new_shifts - 122)
          character << char_changed.chr
        else
          new_shifts = ascii + shift
          character << new_shifts.chr
        end
      end
    end
    character.join("")
  end
end

include CaesarCipher

puts caesar_chipher("oz aowkokaw", 5)