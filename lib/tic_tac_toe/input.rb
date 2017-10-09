require 'pry'
module TicTacToe
	module Input

		def self.board_position(message:)
			get_input(user_message: message, exception_message: "please enter the row and column separated by a comma", regex: /\d+,\d+/)
		end

		def self.number(message:)
			get_input(user_message: message, exception_message: "please enter a number", regex: /\d+/).to_i
		end

		def self.symbol(message:)
			get_input(user_message: message, exception_message: "please enter 'x' or 'o'", regex: /[XxOo]/).downcase.to_sym
		end

		def self.yes?(message:)
			resp = get_input(user_message: message, exception_message: "please enter y or n", regex: /[YyNn]/)
			/[Yy]/ =~ resp
		end

		private

			def self.get_input(user_message:, exception_message:, regex:)
				puts user_message
				resp = gets.chomp
				raise InvalidInputException.new(exception_message) if regex !~ resp
				resp
			rescue InvalidInputException => e
				puts e.message
				retry
			end
	end
end