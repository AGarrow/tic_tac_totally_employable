require 'minitest/autorun'
require 'pry'
require 'tic_tac_toe'

class BoardTest < Minitest::Test
	describe "Board" do
		let(:board) { TicTacToe::Board.new }
		let(:computer) { TicTacToe::Computer.new("Player 1") }
		
		before do
			computer.assign_symbol
		end
		
		describe "get_move" do
			it "should return a valid move" do
				move = computer.get_move(board)
				refute_nil move
				assert board.place_symbol(symbol: computer.symbol, x: move[:x], y: move[:y])
			end
		end

		describe "choose_symbol" do
			it "should choose a symbol if its the first player" do
				assert TicTacToe::Constants::ALLOWED_SYMBOLS.include?(computer.assign_symbol)
			end
		end
	end
end