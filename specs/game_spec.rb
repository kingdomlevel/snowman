require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../hidden_word.rb')

class TestGame < MiniTest::Test
    def setup()
        @tony = Player.new("Tony")
        hidden_word = HiddenWord.new("Donkey Kong")
        @game = Game.new(@tony, hidden_word)
    end

    def test_can_guess_letter__correct
        result = @game.guess('d')
        # assert that the guess is correct
        assert(result)

        # assert that the guess gets added to the guessed letters array
        assert_equal(1, @game.guessed_letters.length())
    end

    def test_can_guess_letter__not_in_word
        result = @game.guess('x')
        # assert that the guess was wrong
        refute(result)

        # check that tony has lost a life
        assert_equal(5, @tony.lives)
    end
    
    def test_game_over__lose
        # make 6 wrong guesses
        @game.guess('x')
        @game.guess('m')
        @game.guess('z')
        @game.guess('a')
        # assert that the game is not over yet
        refute(@game.lost?())

        @game.guess('b')
        @game.guess('c')

        # assert that the game has been lost
        assert(@game.lost?())
    end

    def test_game_won
        @game.guess('d')
        @game.guess('o')
        @game.guess('n')
        @game.guess('k')
        @game.guess('e')
        @game.guess('y')
        @game.guess('B')    # wrong guess
        @game.guess('k')    # already guessed
        @game.guess('o')    # already guessed
        @game.guess('n')    # already guessed
        @game.guess('g')
        refute(@game.lost?())
        assert(@game.won?())
    end

end