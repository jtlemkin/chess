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

		build_pawn_row(2, :white)
		build_king_row(1, :white)
	end

	def build_pawn_row(row, color)
		(1..8).each do |s|
			@coord[[s, row]] = Pawn.new(color)
		end
	end

	def build_king_row(row, color)
		@coord[[1, row]] = Rook.new(color)
		@coord[[8, row]] = Rook.new(color)
		@coord[[2, row]] = Knight.new(color)
		@coord[[7, row]] = Knight.new(color)
		@coord[[3, row]] = Bishop.new(color)
		@coord[[6, row]] = Bishop.new(color)
		@coord[[4, row]] = King.new(color)
		@coord[[5, row]] = Queen.new(color)
	end

	def to_s
		s = " abcdefgh\n"

		cur = :black
		nxt = :white

		(1..8).each do |y|
			cur, nxt = nxt, cur
			s += "#{9 - y}"
			(1..8).each do |x|
				if @coord[[x, y]]
					icon = @coord[[x, y]].to_s
				else
					icon = " "
				end

				s += colorize(icon, cur)
				cur, nxt = nxt, cur
			end
			s += "\n"
		end

		s
	end

	def colorize(text, color)
		case color
		when :black then colored_string(text, "1;42")
		when :white then colored_string(text, "1;47")
		end
	end

	def colored_string(text, color_code)
		"\033[#{color_code}m#{text}\033[0m"
	end
end

puts Board.new
