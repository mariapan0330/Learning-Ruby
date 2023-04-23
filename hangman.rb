=begin
    PLAN:
    + list of possible choices
    + random choice from there
    + start with 6 lives
    + print as many _ as letters

    - have the user guess a letter
    - find all instances of that letter in the word
    - if YES in the word, and replace all matching _
    - if NOT in the word, decrease lives counter by 1
        > and add letter to list of incorrect guesses

    - if lives reach 0, end the game with "You lost! Word was {word}"
    - if player guesses all letters, end game with "You win! Word was {word}"

    - if player guesses more than one letter, count it as a WORD GUESS.
        > Word guesses automatically lose if wrong and automatically win if right
=end

guessed_so_far = []

def choose_word()
    possible_choices = ['jobless', 'irritating', 'ruin', 'bait', 'tire', 'mug', 'grotesque', 'romantic',
        'ambiguous', 'fill', 'act', 'faded', 'violent', 'workable', 'tray', 'disillusioned', 'chicken', 
        'cause', 'irate', 'unhealthy', 'fork', 'annoying', 'hilarious', 'straight', 'cagey', 'sigh', 
        'practice', 'race', 'occur', 'start', 'harass', 'energetic', 'wiggly', 'giants', 'thinkable', 'fact']
    answer = possible_choices.sample()
    blank_word = answer.chars.map { |w| "_" } # for each character in the word, take it into a block but adds "_" to new array
    blank_word = blank_word.join() # could do this in one line but broke it into 2 to comment. .join() joins the words in the array into a string
    # puts blank_word
    return [answer, blank_word]
end

def make_guess()
    puts "Your guess: "
    guess = gets.chomp.upcase
    # puts "You guessed #{guess}"
    if guess.count("a-zA-Z") != guess.length() || guess.length < 1
        system("cls")
        print "'#{guess}' is invalid! Enter only letters. "
        make_guess()
        return # so it doesn't come back and keep checking
    end

    if guess.length == 1
        parse_letter(guess)
    elsif guess.length > 1
        parse_word(guess)
    end
    return guess
end


def parse_letter(guess)

end

def parse_word(guess)
    if guess == answer
        puts "YOU WIN! The answer was #{answer}"
    else
        puts "YOU LOSE! The answer was #{answer}"
    end
end


system("cls")
lives = 6
answer, blank_word = choose_word()
puts answer
puts blank_word

make_guess()
puts "You guessed #{guess}"
