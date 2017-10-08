module TicTacToe
	class Computer < Player
		def choose_symbol
			assign_symbol
		end

		def get_move(board_array)
			board_array.each_with_index do |row, y| 
				row.each_with_index do |cell, x| 
					return { x: x, y: y } if cell.nil?
				end
			end
		end
	end
end