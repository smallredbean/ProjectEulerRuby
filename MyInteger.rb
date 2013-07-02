
require "Prime"

class Integer
	def isEven?
		self%2==0
	end
	def isOdd?
		self%2==1
	end

	def isPalindromic?
		self.to_s==self.to_s.reverse
	end

	def isFactorOf? anInteger
		anInteger%self==0
	end
	def isPrime?
		(2..Math.sqrt(self).to_i).each {|num| return false if num.isFactorOf? self}
		true
	end
	def multiplicityOf primeFactor
		exp = 1
		factor = primeFactor
		while factor.isFactorOf? self
			exp += 1
			factor *= primeFactor
		end
		exp-1
	end
	def primeFactors
		factors = []
		Prime.upto(self) {|num| factors.push num if num.isFactorOf? self}
		factors
	end
	def primeFactorsAndMultiplicities
		factors = primeFactors
		factors.each_with_index {|factor, index|
			factors[index] = [factor, multiplicityOf(factor)]
		}
		factors	
	end
end
