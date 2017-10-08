module TicTacToe
	class Game
		attr_accessor :board, :player_1, :player_2, :winner
		def initialize
			setup
			View.render(self)			
		end

		def play
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

			def setup
				@player_1 = Player.create("Player 1")
				@player_1.choose_symbol
				@player_2 = Player.create("Player 2")
				@player_2.assign_symbol(player_1_symbol: @player_1.symbol)
				@board = Board.create
			end
	end
end