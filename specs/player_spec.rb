require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../player.rb')

class TestPlayer < MiniTest::Test
    def setup()
        @tony = Player.new("Tony")
    end

    def test_player_starts_with_six_lives
        assert_equal(6, @tony.lives)
    end

    def test_player_can_lose_life
        @tony.lose_life()
        assert_equal(5, @tony.lives)
    end
end