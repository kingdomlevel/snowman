class HiddenWord
    attr_reader :word_to_guess

    def initialize(word_to_guess)
        @word_to_guess =  word_to_guess
        # @display_word = word_to_guess.obscure()
    end

    def obscure(guessed_letters = [])
        guessed_letters_string = ""

        # if we have guessed letters, add these in to regex
        for let in guessed_letters
            guessed_letters_string += let.upcase
            guessed_letters_string += let.downcase
        end

        reg_ex = /[^#{guessed_letters_string} ]/
        return @word_to_guess.gsub(reg_ex, '*')
    end

    def letter_in_word?(guessed_letter)
        downcased_word = @word_to_guess.downcase()
        return downcased_word.include?(guessed_letter.downcase())
    end

    def number_unique_letters()
        lower_case_no_whitespace = @word_to_guess.downcase.delete(' ')
        str_array = lower_case_no_whitespace.split("")
        return str_array.uniq.length()
    end

end