module TicTacToe
	class Board
		attr_reader :board_array, :last_move, :num_moves
		def initialize(size: 3)
			@board_array = 0.upto(size-1).map { 0.upto(size-1).map { nil } }
			@num_moves = 0
		end

		def draw?
			num_moves == @board_array.size ** 2
		end

		def place_symbol(symbol:, x:, y:)
			raise InvalidInputException.new("that position is out of range") unless [x,y].all? { |p|  (0..board_array.size - 1) === p }
			raise InvalidInputException.new("theres already a piece there") unless get(x,y).nil?
			@last_move = {x: x, y: y}
			@num_moves += 1
			board_array[y][x] = symbol
		end

		def win?
			return false if num_moves < 5
			horizontal? || vertical? || diagonal?
		end

		private

			def diagonal?
				diag_1_cells = -2.upto(2).map { |i| {x: last_move[:x] + i, y: last_move[:y] + i} }.select { |c| (lower_limit(:x)..upper_limit(:x)) === c[:x] && (lower_limit(:y)..upper_limit(:y)) === c[:y] }
				diag_2_cells = -2.upto(2).map { |i| {x: last_move[:x] + i, y: last_move[:y] - 1} }.select { |c| (lower_limit(:x)..upper_limit(:x)) === c[:x] && (lower_limit(:y)..upper_limit(:y)) === c[:y] }
				three_in_a_row?(diag_1_cells.map { |c| get(c[:x], c[:y]) }) || three_in_a_row?(diag_2_cells.map { |c| get(c[:x], c[:y]) })
			end

			def get(x,y)
				board_array[y][x]
			end

			def horizontal?
				three_in_a_row?(lower_limit(:x).upto(upper_limit(:x)).map { |x| get(x, last_move[:y]) })
			end

			def last_symbol
				get(last_move[:x], last_move[:y])
			end

			def lower_limit(axis)
				(last_move[axis] - 2) >= 0 ? last_move[axis] - 2 : 0
			end

			def three_in_a_row?(array)
				consecutive = 0
				for s in array do
					consecutive = s == last_symbol ? consecutive + 1 : 0
					return true if consecutive == 3
				end
				false
			end

			def upper_limit(axis)
				(last_move[axis] + 2) < board_array.size ? last_move[axis] + 2 : board_array.size - 1
			end

			def vertical?
				three_in_a_row?(lower_limit(:y).upto(upper_limit(:y)).map{ |y| get(last_move[:x], y) })
			end
	end
end