require 'piece'

describe Piece do
	
	let(:piece) {Piece.new(:black)}

	describe ".valid_moves" do

		context "when given an invalid move" do
			it "should return false" do
				expect(piece.valid_move?(0, 0)).to eq(false)
			end
		end

		context "when given a valid move" do
			it "should return true" do
				expect(piece.valid_move?(1, 0)).to eq(true)
			end
		end

	end
end

describe King do
	
	let(:king) {King.new(:black)}

	describe ".valid_moves" do

		context "when given an invalid move" do
			it "should return false" do
				expect(king.valid_move?(2, 1)).to eq(false)
			end
		end

		context "when given a valid move" do
			it "should return true" do
				expect(king.valid_move?(1, -1)).to eq(true)
			end
		end

	end
end

describe Rook do
	
	let(:rook) {Rook.new(:black)}

	describe ".valid_moves" do

		context "when given an invalid move" do
			it "should return false" do
				expect(rook.valid_move?(2, 1)).to eq(false)
			end
		end

		context "when given a valid move" do
			it "should return true" do
				expect(rook.valid_move?(0, -3)).to eq(true)
			end
		end

	end
end

describe Bishop do
	
	let(:bishop) {Bishop.new(:black)}

	describe ".valid_moves" do

		context "when given an invalid move" do
			it "should return false" do
				expect(bishop.valid_move?(0, 1)).to eq(false)
			end
		end

		context "when given a valid move" do
			it "should return true" do
				expect(bishop.valid_move?(4, -4)).to eq(true)
			end
		end

	end
end

