module TicTacToe
	module View
		class << self
			def render(game)
				render_break(game.board.board_array)
				render_user_info(game.player_1, game.player_2)
				render_board(game.board.board_array)
				render_winner(game.winner) if game.winner
				render_draw if game.board.draw?
				render_break(game.board.board_array)
			end

			def render_board(board_array)
				board_array.reverse_each.with_index { |row, i| puts "#{board_array.size - i}|#{row.map { |c| c ? c : ' ' }.join('|')}|" }
				puts " " + "=" * (board_array.size * 2) + "="
				puts "  #{(1..board_array.size).to_a.join(' ')}"
			end

		private

			def render_break(board_array)
				puts '-' * (board_array.size * 2)
			end

			def render_user_info(player_1, player_2)
				[player_1, player_2].each { |p| puts "#{p.name} (#{p.class.to_s.split('::').last}): #{p.symbol}"}
			end

			def render_draw
				puts "it's a draw!!"
			end

			def render_winner(winner)
				puts "#{winner.name} wins!"
			end
		end
	end
end