module TicTacToe
	class Computer < Player
		INF = 1/0.0
		
		def choose_symbol
			assign_symbol
		end

		def get_move(board)
			minimax(board, @symbol, -INF, INF).last
		end

		private

			def minimax(board, symbol, alpha, beta)
				best_move = nil
				return [path_score(board), best_move] if board.win? || board.draw?
				available_moves(board.board_array).each do |m|
					b = board.copy
					b.place_symbol(symbol: symbol, x: m[:x], y: m[:y])
					score = minimax(b, opposite_symbol(symbol), alpha, beta).first

					if symbol == @symbol
						if score > alpha
							alpha = score
							best_move = m
						end
					else
						if score < beta
							beta = score
							best_move = m
						end
					end
					break if alpha >= beta
				end
				symbol == @symbol ? [alpha, best_move] : [beta, best_move]
			end

			def path_score(board)
				return 0 unless board.win?
				board.last_symbol == @symbol ? 10 : -10
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