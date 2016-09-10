class Piece
	attr_accessor :color

	def initialize(color)
		@color = color
	end

	def white
		nil
	end

	def black
		nil
	end

	def valid_move?(x, y)
		does_move?(x, y)
	end

	def does_move?(x, y)
		x != 0 || y != 0
	end

	def to_s
		if @color == :white
			return white
		elsif @color == :black
			return black
		end
	end
end

class Rook < Piece
	def white
		"\u2656"
	end

	def black
		"\u265C"
	end

	def valid_move?(x, y)
		super(x,y) && straight?(x, y)
	end

	def straight?(x, y)
		x == 0 || y == 0
	end
end

class Bishop < Piece
	def white
		"\u2657"
	end

	def black
		"\u265D"
	end

	def valid_move?(x, y)
		super(x,y) && diagonal?(x, y)
	end

	def diagonal?(x, y)
		x.abs == y.abs
	end
end

class Queen < Piece
	def white
		"\u2655"
	end

	def black
		"\u265B"
	end

	def valid_move?(x, y)
		super(x,y) && (straight?(x, y) || diagonal?(x, y))
	end

	def straight?(x, y)
		x == 0 || y == 0
	end

	def diagonal?(x, y)
		x.abs == y.abs
	end
end

class Knight < Piece
	def white
		"\u2658"
	end

	def black
		"\u265E"
	end

	def valid_move?(x, y)
		super(x,y) && l_shape?(x, y)
	end

	def l_shape?(x, y)
		(x.abs == 2 && y.abs == 1) || (y.abs == 2 && x.abs == 1)
	end
end

class Pawn < Piece
	def white
		"\u2659"
	end

	def black
		"\u265F"
	end

	def valid_move?(x, y)
		super(x,y) && forward?(x, y)
	end

	def forward?(x, y)
		x == 1 && y == 0
	end
end

class King < Piece
	def white
		"\u2654"
	end

	def black
		"\u265A"
	end

	def valid_move?(x, y)
		super(x, y) && only_one_tile?(x, y)
	end

	def only_one_tile?(x, y)
		x >= -1 && x <= 1 && y >= -1 && y <= 1
	end
end
