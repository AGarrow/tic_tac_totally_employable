require 'minitest/autorun'
require 'pry'
require 'tic_tac_toe'
class BoardTest < Minitest::Test
	describe "Board" do
		let(:board) { TicTacToe::Board.new }
		describe "initialize" do
			it "should havea size of 3 by default" do
				assert_equal 3, board.board_array.size
			end

			it "should accept other sizes" do
				b = TicTacToe::Board.new(size: 10)
				assert_equal 10, b.board_array.size
			end
		end
		describe "win?" do
			it "should return true if there is a horizontal victory" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				board.place_symbol(symbol: :y, x: 1, y: 1)
				board.place_symbol(symbol: :x, x: 1, y: 0)
				board.place_symbol(symbol: :y, x: 2, y: 1)
				board.place_symbol(symbol: :x, x: 2, y: 0)
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

			it "should return true if there is a diagonal victory" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				board.place_symbol(symbol: :y, x: 1, y: 0)
				board.place_symbol(symbol: :x, x: 1, y: 1)
				board.place_symbol(symbol: :y, x: 2, y: 0)
				board.place_symbol(symbol: :x, x: 2, y: 2)
				assert board.win?
			end

			it "should return false if there is no win condition" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				board.place_symbol(symbol: :y, x: 1, y: 0)
				board.place_symbol(symbol: :x, x: 1, y: 1)
				board.place_symbol(symbol: :y, x: 2, y: 0)
				board.place_symbol(symbol: :x, x: 0, y: 1)
				refute board.win?
			end
		end

		describe "draw?" do
			it "should return false if there are open spaces" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				board.place_symbol(symbol: :y, x: 0, y: 1)
				board.place_symbol(symbol: :x, x: 0, y: 2)
				board.place_symbol(symbol: :y, x: 1, y: 0)
				board.place_symbol(symbol: :x, x: 1, y: 1)
				board.place_symbol(symbol: :y, x: 1, y: 2)
				board.place_symbol(symbol: :x, x: 2, y: 0)
				board.place_symbol(symbol: :y, x: 2, y: 1)
				refute board.draw?
			end

			it "should return true if there are no open spaces" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				board.place_symbol(symbol: :y, x: 0, y: 1)
				board.place_symbol(symbol: :x, x: 0, y: 2)
				board.place_symbol(symbol: :y, x: 1, y: 0)
				board.place_symbol(symbol: :x, x: 1, y: 1)
				board.place_symbol(symbol: :y, x: 1, y: 2)
				board.place_symbol(symbol: :x, x: 2, y: 0)
				board.place_symbol(symbol: :y, x: 2, y: 1)
				board.place_symbol(symbol: :x, x: 2, y: 2)
				assert board.draw?
			end
		end

		describe "place_symbol" do
			it "should raise InvalidInputException if position is out of range" do
				assert_raises TicTacToe::InvalidInputException do
					board.place_symbol(symbol: :x, x: 10, y: 10)
				end
			end

			it "should raise InvalidInputException if position is taken" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				assert_raises TicTacToe::InvalidInputException do
					board.place_symbol(symbol: :y, x: 0, y: 0)
				end				
			end

			it "should place the symbol successfully if input is valid" do
				board.place_symbol(symbol: :x, x: 0, y: 0)
				assert_equal :x, board.board_array[0][0]
			end
		end
	end
end