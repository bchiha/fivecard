require_relative "fivecard"

#tester functions
class Deck
	def addCard(card)
		@deck << card
	end

end

describe Hand, "#ranking" do

	before :each do
		@myhand = Hand.new
		@mydeck = Deck.new
	end

	it "has a high card" do
		@mydeck.addCard(Card.new('10','clubs',9))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('7','clubs',6))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('2','spades',1))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('High Card')
		expect(@myhand.bestHand[:cardRank]).to eq(10)
	end

	it "has a pair" do
		@mydeck.addCard(Card.new('10','clubs',9))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('7','clubs',6))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','spades',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Pair')
		expect(@myhand.bestHand[:cardRank]).to eq(8)
	end

	it "has two pairs" do
		@mydeck.addCard(Card.new('10','clubs',9))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','hearts',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','spades',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Two Pairs')
		expect(@myhand.bestHand[:cardRank]).to eq(10)
	end

	it "has a triple" do
		@mydeck.addCard(Card.new('10','clubs',9))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','diamonds',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','spades',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Triples')
		expect(@myhand.bestHand[:cardRank]).to eq(8)
	end

	it "has quads" do
		@mydeck.addCard(Card.new('9','hearts',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','diamonds',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','spades',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Four of a Kind')
		expect(@myhand.bestHand[:cardRank]).to eq(8)
	end

	it "has full house" do
		@mydeck.addCard(Card.new('jack','hearts',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','diamonds',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','spades',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Full House')
		expect(@myhand.bestHand[:cardRank]).to eq(8)
	end

	it "has a straight" do
		@mydeck.addCard(Card.new('7','hearts',6))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('8','diamonds',7))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','spades',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('10','clubs',9))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Straight')
		expect(@myhand.bestHand[:cardRank]).to eq(10)
	end

	it "has a flush" do
		@mydeck.addCard(Card.new('2','clubs',1))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','clubs',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','clubs',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('ace','clubs',13))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('3','clubs',2))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Flush')
		expect(@myhand.bestHand[:cardRank]).to eq(13)
	end

	it "has a straight flush" do
		@mydeck.addCard(Card.new('7','hearts',6))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('8','hearts',7))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','hearts',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('9','hearts',8))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('10','hearts',9))
		@myhand.addCard(@mydeck)
		expect(@myhand.bestHand[:rankTxt]).to eq('Straight Flush')
		expect(@myhand.bestHand[:cardRank]).to eq(10)
	end

	it "has a royal flush" do
		@mydeck.addCard(Card.new('ace','hearts',13))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('queen','hearts',11))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('jack','hearts',10))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('10','hearts',9))
		@myhand.addCard(@mydeck)
		@mydeck.addCard(Card.new('king','hearts',12))
		@myhand.addCard(@mydeck)
		expect(@myhand.showBestHand).to eq('Royal Flush')
		expect(@myhand.bestHand[:cardRank]).to eq(13)

	end

end

describe Card do

	it "is a king of diamonds" do
		expect(Card.new('king','diamonds',12).show).to eq('king diamonds') 
	end
end

describe Deck do

	it "should return a card" do
		@mydeck = Deck.new
		@mycard = Card.new('ace','hearts',13)
		@mydeck.addCard(@mycard)
		expect(@mydeck.drawCard).to equal(@mycard)
	end
end

