module TicTacToe
	class Computer < Player
		def choose_symbol
			assign_symbol
		end

		def get_move(board_array)
			board_array.each_with_index do |row, row_index| 
				row.each_with_index do |cell, column_index| 
					return { x: row_index, y: column_index } if cell.nil?
				end
			end
		end
	end
end