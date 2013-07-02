class Prime
	def Prime.upto max
		table = []
		n = 2
		while n<=max
			yield n

			table[n] = false
			(n*n).step(max, n) {|num| table[num] = false}
			n += 1 until table[n]!=false
		end
	end
end
