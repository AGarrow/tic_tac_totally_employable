module TicTacToe
	module View
		class << self
			def render(game)
				render_user_info(game.player_1, game.player_2)
				render_board(game.board.board_array)
			end

		private

			def render_user_info(player_1, player_2)
				puts "placeholder"
			end

			def render_board(board_array)
				puts "  #{(1..board_array.size).to_a.join(' ')}"
				puts " " + "=" * (board_array.size * 2) + "="
				board_array.each_with_index { |row, i| puts "#{i+1}|#{row.map { |c| c ? c : ' ' }.join('|')}|" }
			end
		end
	end
end