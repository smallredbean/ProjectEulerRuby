class TriangularNumber
	def TriangularNumber.list
		triNum = 0
		num = 1
		while true
			triNum += num
			num += 1
			yield triNum
		end
	end
end
