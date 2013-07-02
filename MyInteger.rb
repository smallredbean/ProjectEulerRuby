
require "Prime"

class Integer
	def isFactorOf? anInteger
		anInteger%self==0
	end
	
	def isEven?
		self%2==0
	end
	def isOdd?
		self%2==1
	end

	def isPrime?
		(2..Math.sqrt(self).to_i).each {|num| return false if num.isFactorOf? self}
		true
	end

	def primeFactors
		Prime.upto(Math.sqrt(self).to_i) {|num| yield num if num.isFactorOf? self}
	end
end
