#!/usr/bin/env ruby

def find_match cipher
	match = Array.new
	@codeBook.each {|key, cipherSet|
		index1 = 0
		index2 = 0
		while index1<cipher.size and index2<cipherSet.size
			break if cipher[index1]<cipherSet[index2]
			if cipher[index1]==cipherSet[index2]
				index1 += 1
			else
				index2 += 1
			end
		end
		if index1==cipher.size
			match.push key
		end
	}
	match
end

def decode ciphertext, key
	plaintext = Array.new
	(0...(ciphertext.size)).each {|index|
		plaintext.push ciphertext[index].to_i^key[index%key.size]
	}
	plaintext
end

@codeBook = Hash.new
(97..122).each {|key| # "Encryption key consists of three lower case characters"
	@codeBook[key] = Array.new
	#(32..126).each {|text| @codeBook[key].push text^key}

	(48..57).each {|text| @codeBook[key].push text^key} # "0"-"9"
	(65..90).each {|text| @codeBook[key].push text^key} # "A"-"Z"
	(97..122).each {|text| @codeBook[key].push text^key} # "a"-"z"
	@codeBook[key].push 32^key # " "
	@codeBook[key].push 33^key # "!"
	@codeBook[key].push 34^key # """
#	@codeBook[key].push 35^key # "#"
#	@codeBook[key].push 36^key # "$"
#	@codeBook[key].push 37^key # "%"
#	@codeBook[key].push 38^key # "&"
	@codeBook[key].push 39^key # "'"
	@codeBook[key].push 40^key # "("
	@codeBook[key].push 41^key # ")"

	@codeBook[key].push 44^key # ","
	@codeBook[key].push 46^key # "."
#	@codeBook[key].push 47^key # "/"
#	@codeBook[key].push 58^key # ":"
	@codeBook[key].push 59^key # ";"
	@codeBook[key].push 63^key # "?"
#	@codeBook[key].push 64^key # "@"
#	@codeBook[key].push 126^key # "~"

	@codeBook[key].uniq!
	@codeBook[key].sort!
}

key = Array.new(3)
data = File.open('cipher1.txt', 'r').read.chomp.split(',')
(0...3).each {|setIndex|
	cipher = Array.new
	(setIndex...(data.size)).step(3) {|index| cipher.push data[index].to_i}
	cipher.uniq!.sort!

	possibleKeyLetter = find_match cipher
	key[setIndex] = possibleKeyLetter[0] if possibleKeyLetter.size==1
}

text = decode data, key
sum = 0
text.each {|v| sum += v}
puts sum

