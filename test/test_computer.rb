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
			it "should start at the center for new games" do
				assert_equal({ x: 2, y: 2}, computer.get_move(board))
			end
		end
	end
end