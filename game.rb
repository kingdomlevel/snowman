class Game
    attr_reader :player, :hidden_word, :guessed_letters

    def initialize(player, hidden_word)
        @player = player
        @hidden_word = hidden_word
        @guessed_letters = []
        @melt_reactions = [
            "🧣I have melted so much, my scarf has fallen off",
            "🥕 oh no! my nose!",
            "🤳 my arm; it is wasting away in the winter sun",
            "🦴 my old bones... they are melting...",
            "💀 i am close to the end"
        ]
    end

    def guess(letter)
        # push guess to guessed_letters array, as long as it has not been guessed already
        if (!@guessed_letters.include?(letter))
            @guessed_letters.push(letter)
        end

        # check if the guess was correct; if incorrect, player must lose a life
        result = @hidden_word.letter_in_word?(letter)
        if (!result)
            @player.lose_life()
        end

        return result
    end

    def lost?
        if (@player.lives <= 0)
            return true
        else 
            return false
        end
    end

    def won?
        if (!lost?())
            # keep track of num of letters in correct word
            num_of_letters_to_find = @hidden_word.number_unique_letters()
            counter = 0

            # loop over letters in correct word and see if they have been guessed
            for letter in @guessed_letters
                if (@hidden_word.letter_in_word?(letter))
                    counter += 1
                end
            end

            # if all correct letters have been guessed, the game is won!
            if (counter == num_of_letters_to_find)
                return true
            else
                return false
            end
        end
    end

    def get_snowman_melt_reaction()
        return @melt_reactions[-@player.lives]
    end


end