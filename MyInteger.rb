
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
		remainer = self
		exponent = 0
		while primeFactor.isFactorOf? remainer
			remainer /= primeFactor
			exponent += 1
		end
		[exponent, remainer]
	end
	def primeFactorsAndMultiplicities
		factors = []
		selfRemainer = self
		Prime.upto(Math.sqrt(self).to_i) {|num|
			multiplicity, selfRemainer = selfRemainer.multiplicityOf(num)
			factors.push([num, multiplicity]) if multiplicity!=0
		}
		factors.push([selfRemainer, 1]) if selfRemainer!=1
		factors	
	end
	def primeFactors
		factors = []
		primeFactorsAndMultiplicities.each{|factor, multiplicity| factors.push factor}
		factors
	end

end