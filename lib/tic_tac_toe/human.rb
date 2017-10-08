module TicTacToe
	class Human < Player
		def choose_symbol
			puts "would you like to play as x or o ? (please enter 'x' or 'o')"
			input = gets.chomp
			raise InvalidInputException.new("please enter 'x' or 'o'") unless Constants::ALLOWED_SYMBOLS.include?(input.to_sym)
			@symbol = input.to_sym
		rescue InvalidInputException => e
			puts e.message
			retry
		end

		def get_move(board_array)
			puts "select position in the form x,y where x and y are between 1 and #{board_array.size}"
			input = gets.chomp
			raise InvalidInputException.new("please enter the row and column separated by a comma") unless input =~ /\d+,\d+/
			m = input.split(",").map { |i| i.to_i - 1 }
			{ x: m.first, y: m.last }
		rescue InvalidInputException => e
			puts e.message
			retry
		end
	end
end