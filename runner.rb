require_relative('./player.rb')
require_relative('./game.rb')
require_relative('./hidden_word.rb')

# intro spiel
p "⛄️: Greetings traveller!"
input = gets.chomp()
p "⛄️: Another winter... another period I must spend on this earth..."
gets.chomp()
p "⛄️: Another Christmas... another year beginning..."
gets.chomp()
p "⛄️: Once again, I will perish to the elements."
gets.chomp()
p "⛄️: But you can help me!"
gets.chomp()

# get name
p "⛄️: What is your name, anyway?"
name = gets.chomp()
player = Player.new(name)
p "⛄️: #{name}, eh? I once knew a snow person called #{name}... they were the dearest friend I ever knew..."
p "⛄️: So many winters on this earth..."

# get secret word
p "⛄️: Enter secret word:"
input_word = gets.chomp()
hidden_word = HiddenWord.new(input_word)

# start game
game = Game.new(player, hidden_word)
system "clear"


while(true)
    # prompt guess
    p "   word to guess: #{hidden_word.obscure(game.guessed_letters)}"
    p "   lives: #{player.get_life_display_string()}"
    p "⛄️: OK #{name}, what is your guess?"

    # get guess from player
    input_guess = gets.chomp()
    result = game.guess(input_guess)

    if (result)
        system "clear"
        if (game.won?())
            break;
        else
            p "⛄️: Yes! This is a great success! Please continue..."
        end
    else
        system "clear"
        if (game.lost?())
            break
        else
            p "⛄️: #{game.get_snowman_melt_reaction()}"
        end
    end

end

if (game.won?())
    p "⛄️: Oh my Christmas! You have only gone and done it, #{name}!"
    p "⛄️: When you go home tonight, there's gonna be another story on your house! 🏠"
    p "⛄️: The word was #{hidden_word.word_to_guess}"
    p '⛄️: Thanks for playing! Goodbye, hope to "sleigh" you around soon!'
else
    p "👨🏼‍🌾: Ahhh, another beautiful spring 🌞."
    p "👨🏼‍🌾: What's that about a snow person?"
    p "👨🏼‍🌾: He perished long ago. All that is left is this note:"
    p "    📜The word was #{hidden_word.word_to_guess}"
    p "👨🏼‍🌾: I guess we will never know the true mystery of the Snowman™️"
    p "👨🏼‍🌾: I'm off to enjoy a glass of ice-cold lemonade 🌞🍋"
    p "👨🏼‍🌾: Goodbye!"
end


