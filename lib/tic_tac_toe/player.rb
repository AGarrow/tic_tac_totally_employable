module TicTacToe
	class Player
			attr_reader :symbol, :name

		def initialize(name)
			@name = name
		end

		def self.create(name)
			Module.const_get("TicTacToe::#{human?(name) ?  Human : Computer}").new(name)
		end

		def assign_symbol(player_1_symbol: nil)
			@symbol = player_1_symbol ? Constants::ALLOWED_SYMBOLS.reject { |s| s == player_1_symbol }.first : Constants::ALLOWED_SYMBOLS.sample
		end

		private

			def self.human?(name)
				Input.yes?(message: "#{name}, are you human? (enter y or n)")
			end
	end
end