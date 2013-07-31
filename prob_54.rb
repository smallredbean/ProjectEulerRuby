#!/usr/bin/env ruby

class PokerHand
	attr_reader :handRank
	attr_reader :cardRanks

	def initialize(fiveCards)
		# Reformate
		cards = Array.new
		fiveCards.each {|card|
			r = 0
			case card[0, 1]
			when 'T'
				r = 10
			when 'J'
				r = 11
			when 'Q'
				r = 12
			when 'K'
				r = 13
			when 'A'
				r = 14
			else
				r = card[0, 1].to_i
			end
			cards.push [r, card[1, 1]]
		}

		# Sort by rank
		cards.sort! {|a, b| a[0]<=>b[0] }

		# Determine hand rank and card ranks
		# Royal Flush
		if cards[0][0]==10
			isRoyalFlush = true
			(1...(cards.size)).each {|index|
				if cards[index][0]!=cards[0][0]+index or cards[index][1]!=cards[0][1]
					isRoyalFlush = false
					break
				end
			}
			if isRoyalFlush
				@handRank = 9
				@cardRanks = nil
				return
			end
		end
		# Straight Flush
		isStraightFlush = true
		(1...(cards.size)).each {|index|
			if cards[index][0]!=cards[0][0]+index or cards[index][1]!=cards[0][1]
				# Handle special case of "Ace-2-3-4-5"
				if cards[0][0]==2 and index==4 and cards[4][0]==14
					cards.insert 0, cards.pop
					cards[0][0] = 1
					break
				end
				isStraightFlush = false
				break
			end
		}
		if isStraightFlush
			@handRank = 8
			@cardRanks = [cards.last[0]]
			return
		end
		# Four of a Kind
		if cards[0][0]==cards[1][0] and
			cards[1][0]==cards[2][0] and
			cards[2][0]==cards[3][0]
			@handRank = 7
			@cardRanks = [cards[0][0], cards[4][0]]
			return
		end
		if cards[1][0]==cards[2][0] and
			cards[2][0]==cards[3][0] and
			cards[3][0]==cards[4][0]
			@handRank = 7
			@cardRanks = [cards[1][0], cards[0][0]]
			return
		end
		# Full House
		if cards[0][0]==cards[1][0] and	cards[1][0]==cards[2][0] and
			cards[3][0]==cards[4][0]
			@handRank = 6
			@cardRanks = [cards[0][0], cards[3][0]]
			return
		end
		if cards[2][0]==cards[3][0] and cards[3][0]==cards[4][0] and
			cards[0][0]==cards[1][0]
			@handRank = 6
			@cardRanks = [cards[2][0], cards[0][0]]
			return
		end
		# Flush
		isFlush = true
		(1...(cards.size)).each {|index|
			if cards[index][1]!=cards[0][1]
				isFlush = false
				break
			end
		}
		if isFlush
			@handRank = 5
			@cardRanks = Array.new
			cards.reverse.each {|r, s| @cardRanks.push r}
			return
		end
		# Straight
		isStraight = true
		(1...(cards.size)).each {|index|
			if cards[index][0]!=cards[0][0]+index
				# Handle special case of "Ace-2-3-4-5"
				if cards[0][0]==2 and index==4 and cards[4][0]==14
					cards.insert 0, cards.pop
					cards[0][0] = 1
					break
				end
				isStraight = false
				break
			end
		}
		if isStraight
			@handRank = 4
			@cardRanks = cards.last[0]
			return
		end
		# Three of a Kind
		if cards[0][0]==cards[1][0] and	cards[1][0]==cards[2][0]
			@handRank = 3
			@cardRanks = [cards[0][0], cards[4][0], cards[3][0]]
			return
		end
		if cards[1][0]==cards[2][0] and	cards[2][0]==cards[3][0]
			@handRank = 3
			@cardRanks = [cards[1][0], cards[4][0], cards[0][0]]
			return
		end
		if cards[2][0]==cards[3][0] and	cards[3][0]==cards[4][0]
			@handRank = 3
			@cardRanks = [cards[4][0], cards[1][0], cards[0][0]]
			return
		end
		# Two Pairs
		if cards[0][0]==cards[1][0] and	cards[2][0]==cards[3][0]
			@handRank = 2
			@cardRanks = [cards[2][0], cards[0][0], cards[4][0]]
			return
		end
		if cards[0][0]==cards[1][0] and	cards[3][0]==cards[4][0]
			@handRank = 2
			@cardRanks = [cards[3][0], cards[0][0], cards[2][0]]
			return
		end
		if cards[1][0]==cards[2][0] and	cards[3][0]==cards[4][0]
			@handRank = 2
			@cardRanks = [cards[3][0], cards[1][0], cards[0][0]]
			return
		end
		# One Pair
		if cards[0][0]==cards[1][0] 
			@handRank = 1
			@cardRanks = [cards[0][0], cards[4][0], cards[3][0], cards[2][0]]
			return
		end
		if cards[1][0]==cards[2][0] 
			@handRank = 1
			@cardRanks = [cards[1][0], cards[4][0], cards[3][0], cards[0][0]]
			return
		end
		if cards[2][0]==cards[3][0] 
			@handRank = 1
			@cardRanks = [cards[2][0], cards[4][0], cards[1][0], cards[0][0]]
			return
		end
		if cards[3][0]==cards[4][0] 
			@handRank = 1
			@cardRanks = [cards[3][0], cards[2][0], cards[1][0], cards[0][0]]
			return
		end
		#High Card
		@handRank = 0
		@cardRanks = Array.new
		cards.reverse.each {|r, s| @cardRanks.push r}
	end
	
	def defeats(hand)
		return true if @handRank>hand.handRank
		return false if @handRank<hand.handRank

		(0...@cardRanks.size).each {|index|
			return true if @cardRanks[index]>hand.cardRanks[index]
			return false if @cardRanks[index]<hand.cardRanks[index]
		}
		false
	end
end

count = 0
File.open('poker.txt', 'r').each {|twohands|
	data = twohands.chomp.split(' ');
	count += 1 if PokerHand.new(data[0..4]).defeats PokerHand.new(data[5..9])
}
puts count
