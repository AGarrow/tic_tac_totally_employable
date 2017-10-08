module TicTacToe
	class Player
		attr_reader :symbol

		def assign_symbol(player_1_symbol: nil)
			@symbol = player_1_symbol ? Constants::ALLOWED_SYMBOLS.reject { |s| s == player_1_symbol }.first : Constants::ALLOWED_SYMBOLS.first
		end
	end
end