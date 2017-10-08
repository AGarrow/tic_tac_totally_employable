require 'minitest/autorun'
require 'pry'
require 'tic_tac_toe'
class BoardTest < Minitest::Test
	describe "win?" do
		let(:board) { TicTacToe::Board.new }
		it "should return true if there is a horizontal victory" do
			board.place_symbol(symbol: :x, x: 1, y: 0)
			board.place_symbol(symbol: :y, x: 2, y: 1)
			board.place_symbol(symbol: :x, x: 2, y: 0)
			board.place_symbol(symbol: :y, x: 3, y: 1)
			board.place_symbol(symbol: :x, x: 3, y: 0)
			assert board.win?
		end

		it "should return true if there is a vertical victory" do
			board.place_symbol(symbol: :x, x: 0, y: 0)
			board.place_symbol(symbol: :y, x: 1, y: 1)
			board.place_symbol(symbol: :x, x: 0, y: 1)
			board.place_symbol(symbol: :y, x: 2, y: 1)
			board.place_symbol(symbol: :x, x: 0, y: 2)
			assert board.win?
		end
	end
end