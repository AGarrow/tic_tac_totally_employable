module TicTacToe
	class InvalidInputException < Exception; end
	class << self
		def play
			g = Game.new.play
			while replay?
				g = reset_game? ? g.reset.play : Game.new.play
			end
		end

		private

			def replay?
				puts "would you like to play again? (please enter 'y' or 'n'"
				resp = gets.chomp
				raise InvalidInputException.new("please enter 'y' or 'n'") unless resp =~ /[YyNn]/
				resp =~ /[Yy]/
			rescue InvalidInputException => e
				puts e.message
				retry
			end

			def reset_game?
				puts "would you like keep the same settings? (please enter 'y' or 'n'"
				resp = gets.chomp
				raise InvalidInputException.new("please enter 'y' or 'n'") unless resp =~ /[YyNn]/
				resp =~ /[Yy]/
			rescue InvalidInputException => e
				puts e.message
				retry				
			end
	end
end