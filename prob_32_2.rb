#!/usr/bin/env ruby

class Integer 
	def hasZeroDigit
		to_s.each_char {|ch| return true if ch=='0'}
		false
	end
	def hasDuplicatedDigit
		digits = Array.new(10, false)
		to_s.each_char {|ch|
			return true if digits[ch.to_i]==true
			digits[ch.to_i] = true
		}
		false
	end
	def hasDigitOf num
		digits = Array.new(10, false)
		to_s.each_char {|ch| digits[ch.to_i] = true}
		num.to_s.each_char {|numCh| return true if digits[numCh.to_i]==true}
		false
	end
end

def isPandigital string
	return false if string.length!=9
	digits = Array.new(10, false)
	string.each {|ch|
		return false if digits[ch.to_i]==true
		digits[ch.to_i] = true
	}
	true
end

def search dA, dB
	(10**(dA-1)...10**dA).each {|a|
		print "A is ", a, "\n"
		next if a.hasZeroDigit or a.hasDuplicatedDigit
		(10**(dB-1)...10**dB).each {|b|
			if b.hasZeroDigit or b.hasDuplicatedDigit or a.hasDigitOf b
				next
			else
				c = a*b
				break if a.to_s.length+b.to_s.length+c.to_s.length>9
				if c.hasZeroDigit or c.hasDuplicatedDigit or a.hasDigitOf c or b.hasDigitOf c
					next
				else
					print a, " * ", b, " = ", c, "\n"
					@products[c] = true if isPandigital a.to_s+b.to_s+c.to_s
				end
			end
		}
	}
end

@products = Hash.new
search 1, 4
search 2, 3
@products.each {|x| puts x}
