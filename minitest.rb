require "minitest/autorun"

class HumanPlayerTests < MiniTest::Test
	def test_can_make_a_player
		assert HumanPlayer.new
	end	
end

class RandomPlayerTests < MiniTest::Test
	def test_can_build_player
		assert RandomPlayer.new
	end
end