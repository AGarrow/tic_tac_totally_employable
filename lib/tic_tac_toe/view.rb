module TicTacToe
	module View
		def self.render(board)
			puts "  #{(1..board.board_array.size).to_a.join(' ')}"
			puts " " + "=" * (board.board_array.size * 2) + "="
			board.board_array.each_with_index { |row, i| puts "#{i+1}|#{row.map { |c| c ? c : ' ' }.join('|')}|" }
		end
	end
end