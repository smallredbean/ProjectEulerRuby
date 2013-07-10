
class String
	def hasCharacterInDuplicate
		presence = Hash.new
		each_char {|ch|
			return true if presence[ch]
			presence[ch] = true
		}
		false
	end

	def alphabeticalValue
		base = ?a-1
		value = 0
		downcase.each_byte {|ascii| value += ascii-base}
		value
	end
end
