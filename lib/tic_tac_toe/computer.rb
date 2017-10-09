module TicTacToe
	class Computer < Player
		def choose_symbol
			assign_symbol
		end

		def get_move(board)
			minimax(board)
			@move
		end

		private

			def minimax(board)
				return path_score(board) if board.win? || board.draw?
				symbol = board.last_symbol ? opposite_symbol(board.last_symbol) : @symbol
				scores = []
				moves = []
				available_moves(board.board_array).each do |m|
					b = board.copy
					b.place_symbol(symbol: symbol, x: m[:x], y: m[:y])
					scores.push(minimax(b))
					moves.push(m)
				end

				if symbol == @symbol
					max_score_index = scores.each_with_index.max[1]
					@move = moves[max_score_index]
					return scores[max_score_index]
				else
					min_score_index = scores.each_with_index.min[1]
					@move = moves[min_score_index]
					return scores[min_score_index]
				end

			end

			def path_score(board)
				return 0 unless board.win?
				board.last_symbol == @symbol ? 1 : -1
			end

			def available_moves(board_array)
				board_array.each_with_index.map do |row, y|
					row.each_with_index.map do |cell, x|
						{x: x, y: y} if cell.nil?
					end
				end.flatten.compact
			end

			def opposite_symbol(symbol)
				Constants::ALLOWED_SYMBOLS.reject { |s| s == symbol }.first
			end
	end
end