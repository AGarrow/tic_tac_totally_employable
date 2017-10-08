module TicTacToe
	class InvalidInputException < Exception; end
	class << self
		def play
			Game.new.play
		end
	end
end