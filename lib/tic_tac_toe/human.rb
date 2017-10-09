module TicTacToe
	class Human < Player
		def choose_symbol
			@symbol = Input.symbol(message: "would you like to play as x or o ? (please enter 'x' or 'o')")
		end

		def get_move(board)
			input = Input.board_position(message: "#{@name}: select position in the form x,y where x and y are between 1 and #{board.board_array.size}")
			m = input.split(",").map { |i| i.to_i - 1 }
			{ x: m.first, y: m.last }
		end
	end
end