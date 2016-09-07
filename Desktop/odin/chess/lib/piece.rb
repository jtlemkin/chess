class Piece
	attr_accessor :color

	def initialize(color)
		@color = color
	end

	def valid_move?(x, y)
		does_move?(x, y)
	end

	def does_move?(x, y)
		x != 0 || y != 0
	end
end

class King < Piece
	def initialize(color)
		super(color)
	end

	def valid_move?(x, y)
		super(x, y) && only_one_tile?(x, y)
	end

	def only_one_tile?(x, y)
		x >= -1 && x <= 1 && y >= -1 && y <= 1
	end
end

class Rook < Piece
	def initialize(color)
		super(color)
	end

	def valid_move?(x, y)
		super(x,y) && straight?(x, y)
	end

	def straight?(x, y)
		x == 0 || y == 0
	end
end

class Bishop < Piece
	def initialize(color)
		super(color)
	end

	def valid_move?(x, y)
		super(x,y) && diagonal?(x, y)
	end

	def diagonal?(x, y)
		x.abs == y.abs
	end
end

class Queen < Piece
	def initialize(color)
		super(color)
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
	def initialize(color)
		super(color)
	end

	def valid_move?(x, y)
		super(x,y) && l_shape?(x, y)
	end

	def l_shape?(x, y)
		(x.abs == 2 && y.abs == 1) || (y.abs == 2 && x.abs == 1)
	end
end

class Pawn < Piece
	def initialize(color)
		super(color)
	end

	def valid_move?(x, y)
		super(x,y) && forward?(x, y)
	end

	def forward?(x, y)
		x == 1 && y == 0
	end
end
