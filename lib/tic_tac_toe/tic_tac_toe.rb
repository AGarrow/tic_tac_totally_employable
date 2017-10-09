module TicTacToe
	class InvalidInputException < Exception; end
	class << self
		def play
			g = Game.new.play
			while replay?
				g = reset_game? ? g.reset.play : Game.new.play
			end
			puts "bye!"
		end

		private

			def replay?
				Input.yes?(message: "would you like to play again? (please enter 'y' or 'n'")
			end

			def reset_game?
				Input.yes?(message: "would you like keep the same settings? (please enter 'y' or 'n'")
			end
	end
end