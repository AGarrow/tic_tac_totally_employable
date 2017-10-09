require 'minitest/autorun'
require 'pry'
require 'tic_tac_toe'

class PlayerTest < Minitest::Test
	describe "Player" do
		describe "create" do
			it "should create a computer player if input is no" do
				TicTacToe::Input.stubs(:yes?).returns(false)
				assert_equal "TicTacToe::Computer", TicTacToe::Player.create("test").class.to_s
			end

			it "should create a human player if input is yes" do
				TicTacToe::Input.stubs(:yes?).returns(true)
				assert_equal "TicTacToe::Human", TicTacToe::Player.create("test").class.to_s				
			end
		end

		describe "assign_symbol" do
			let(:player) { TicTacToe::Human.new("test") }
			it "should choose x if first player is o" do
				assert_equal :x, player.assign_symbol(player_1_symbol: :o)
			end

			it "should choose o if the first player is x" do
				assert_equal :o, player.assign_symbol(player_1_symbol: :x)
			end
		end
	end
end