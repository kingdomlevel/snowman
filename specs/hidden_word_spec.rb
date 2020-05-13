require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
 
require_relative('../hidden_word.rb')
require_relative('../game.rb')
require_relative('../player.rb')


class HiddenWordTest < MiniTest::Test
    def setup
        @my_word = HiddenWord.new("Donkey Kong")
    end

    def test_has_word_to_guess
        assert_equal("Donkey Kong", @my_word.word_to_guess)
    end

    def test_word_can_be_obscured__no_guessed_letters
        assert_equal("****** ****", @my_word.obscure())
    end

    def test_word_can_be_obscured__some_guessed_letters
        # arrange
        tony = Player.new("Tony")
        game = Game.new(tony, @my_word)
        # correct guesses
        game.guess('d')
        game.guess('k')
        # incorrect guesses
        game.guess('x')

        assert_equal("D**k** K***", @my_word.obscure(game.guessed_letters))

    end

    def test_letter_in_word_true
        assert(@my_word.letter_in_word?('D'))
        assert(@my_word.letter_in_word?('d'))
    end

    def test_letter_in_word_false
        refute(@my_word.letter_in_word?('x'))
    end

    def test_num_unique_letters
        assert_equal(@my_word.number_unique_letters(), 7)
    end

    

    
end