require 'minitest/autorun'
require 'pry'
require 'tic_tac_toe'
require 'mocha/mini_test'

class GameTest < Minitest::Test
	describe "Game" do
		describe "play" do
			it "should end in a draw if played between two computers" do
				TicTacToe::Input.stubs(:yes?).returns(false)
				TicTacToe::Input.stubs(:number).returns(3)
				game = TicTacToe::Game.new.play
				assert game.board.draw?
			end
		end
	end
end