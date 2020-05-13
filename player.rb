class Player
    attr_reader :name, :lives

    def initialize(name)
        @name = name
        @lives = 6
    end

    def lose_life()
        @lives -= 1
    end

    def get_life_display_string
        counter = 0
        output = ""

        while counter < @lives
            output += " 💖 "
            counter += 1
        end

        return output   
    end
end