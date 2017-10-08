module TicTacToe
	class Game
		attr_accessor :board, :player_1, :player_2, :winner
		def initialize
			@player_1 = create_player
			@player_1.choose_symbol
			@player_2 = create_player
			@player_2.assign_symbol(player_1_symbol: @player_1.symbol)
			@board = create_board
			View.render(self)
			current_player = @player_1
			until @winner do
				begin
					@board.place_symbol(symbol: current_player.symbol, **current_player.get_move(@board.board_array))
					@winner = @board.win? ? current_player : nil
					View.render(self)
					current_player = current_player == @player_1 ? @player_2 : @player_1
				rescue InvalidInputException => e
					puts e.message
					retry
				end
			end
		end

		private

			def create_board
				puts "how many rows and columns would you like the board to have?"
				resp = gets.chomp
				raise InvalidInputException.new("please enter a number") if /\d+/ !~ resp
				Board.new(size: resp.to_i)
			end

			def create_player
				player = Module.const_get("TicTacToe::#{human? ?  Human : Computer}").new
			end

			def human?
				puts "Player #{@player_1.nil? ? '1' : '2'}, are you human? (enter y or n)"
				resp = gets
				raise InvalidInputException.new("please enter y or n") if /[YyNn]/ !~ resp
				/[Yy]/ =~ resp
			rescue InvalidInputException => e
				puts e.message
				retry
			end
	end
end