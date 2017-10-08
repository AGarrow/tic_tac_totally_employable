module TicTacToe
	class Board
		attr_reader :board_array, :last_move, :num_moves
		def initialize(size: 4)
			@board_array = 0.upto(size-1).map { 0.upto(size-1).map { nil } }
			@num_moves = 0
		end

		def draw?
			num_moves == (@board_array.size + 1) ^ 2
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
			horizontal? || vertical?
		end

		private

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