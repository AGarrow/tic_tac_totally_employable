module TicTacToe
	class BoardState < Board
		def initialize(board)
			@board_array = board.board_array.map { |r| r.map { |c| c } }
			@last_move = board.last_move&.dup
			@num_moves = board.num_moves&.dup
		end
	end
end