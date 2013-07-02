class Fibonacci
	def Fibonacci.upto max
		n1, n2 = 1, 2
		while n1<=max
			yield n1
			n1, n2 = n2, n1+n2
		end
	end
end
