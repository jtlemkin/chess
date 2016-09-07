require './lib/piece'

class Board
	attr_accessor :coord

	def initialize
		@coord = Hash.new
		add_pieces
	end

	def add_pieces
		build_king_row(8, :black)
		build_pawn_row(7, :black)

		build_pawn_row(2, :black)
		build_king_row(1, :black)
	end

	def build_pawn_row(row, color)
		('a'..'h').each do |s|
			@coord[[row, s]] = Pawn.new(color)
		end
	end

	def build_king_row(row, color)
		@coord[[row, 'a']] = Rook.new(color)
		@coord[[row, 'h']] = Rook.new(color)
		@coord[[row, 'b']] = Knight.new(color)
		@coord[[row, 'g']] = Knight.new(color)
		@coord[[row, 'c']] = Bishop.new(color)
		@coord[[row, 'f']] = Bishop.new(color)
		@coord[[row, 'd']] = King.new(color)
		@coord[[row, 'e']] = Queen.new(color)
	end
end

p Board.new.coord[[1, 'a']]