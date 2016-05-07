def caesar_cipher(sentance, shift)
	alphabet = ('a'..'z').to_a
	count = 0
	is_upcase = false
	sentance.split("").each do |letter|
		if letter == letter.upcase
			is_upcase = true
			letter.downcase!
		end
		if alphabet.include? letter
			index_of_alphabet = alphabet.index(letter)
			index_of_alphabet = (index_of_alphabet + shift) % 26

			letter = alphabet[index_of_alphabet]
			if (is_upcase) 
				letter.upcase! 
		  end
			sentance[count] = letter
		end
		count += 1
		is_upcase = false
	end
	sentance
end
