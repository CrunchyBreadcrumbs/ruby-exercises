puts "Input a phrase:"

cipher = gets.chomp

puts "Input a number key:"

number = gets.chomp.to_i

def make_cipher(phrase, key, ciphertext = "")
  arr = phrase.split("")
  arr.each do |character|
    if character.match?(/[[:punct:]]/) || character.match?(/[[:space:]]/) || character.match?(/[[:digit:]]/)
      ciphertext += character
    elsif character == character.upcase
      ciphertext += ((((character.ord - "A".ord) + key) % 26) + "A".ord).chr
    elsif character == character.downcase
      ciphertext += ((((character.ord - "a".ord) + key) % 26) + "a".ord).chr
    end 
  end
  puts "#{ciphertext}"
end

make_cipher(cipher, number)