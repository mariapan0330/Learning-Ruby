=begin
    PLAN:
    + list of possible choices
    + random choice from there
    + start with 6 lives
    + print as many _ as letters

    + have the user guess a letter
    + if player guesses more than one letter, count it as a WORD GUESS.
        + Word guesses automatically lose if wrong and automatically win if right
        
    - for LETTER GUESS
        > find all instances of that letter in the word
        > if YES in the word, and replace all matching _
        > if NOT in the word, decrease lives counter by 1 & add letter to list of incorrect guesses

    - if lives reach 0, end the game with "You lost! Word was {word}"
    - if player guesses all letters, end game with "You win! Word was {word}"

=end

def choose_word()
    possible_choices = ['jobless', 'irritating', 'ruin', 'bait', 'tire', 'mug', 'grotesque', 'romantic',
        'ambiguous', 'fill', 'act', 'faded', 'violent', 'workable', 'tray', 'disillusioned', 'chicken', 
        'cause', 'irate', 'unhealthy', 'fork', 'annoying', 'hilarious', 'straight', 'cagey', 'sigh', 
        'practice', 'race', 'occur', 'start', 'harass', 'energetic', 'wiggly', 'giants', 'thinkable', 'fact']
    answer = possible_choices.sample()
    guessed_so_far = answer.chars.map { |w| "_" } # for each character in the word, take it into a block but adds "_" to new array
    guessed_so_far = guessed_so_far.join() # could do this in one line but broke it into 2 to comment. .join() joins the words in the array into a string
    return [answer, guessed_so_far]
end

def make_guess(answer, guessed_so_far, wrong_guesses, lives, game_over)
    puts "Your guess: "
    guess = gets.chomp.downcase
    # puts "You guessed #{guess}"
    if guess.count("a-zA-Z") != guess.length() || guess.length < 1
        system("cls")
        print "'#{guess}' is invalid! Enter only letters. "
        make_guess(answer, guessed_so_far, wrong_guesses, lives, game_over)
        return # so it doesn't come back and keep checking
    end

    if guess.length == 1
        parse_letter(guess, answer, guessed_so_far, wrong_guesses, lives, game_over)
    elsif guess.length > 1
        parse_word(guess, answer, guessed_so_far, wrong_guesses, lives, game_over)
    end
    return guess
end


def parse_letter(guess, answer, guessed_so_far, wrong_guesses, lives, game_over)
    if answer.include?(guess)
        # puts "YES, #{guess.upcase} IS in answer"
        indexes = []
        answer.each_char.each_with_index do |c, i| # iterate through each character (c) and their indexes (i)
            # if the current character matches guessed character, add it to the indexes list
            if c == guess
                indexes << i
            end
        end
        
        indexes.each do |i| #iterate through each matching index.
            # and replace the character at that index in guessed_so_far with the currently guessed letter
            guessed_so_far[i] = guess
        end
    else
        wrong_guesses += guess
        lives -= 1
    end
    
    print_board(guessed_so_far, wrong_guesses, lives)
end

def parse_word(guess, answer, guessed_so_far, wrong_guesses, lives, game_over)
    if guess == answer
        puts "YOU WIN! The answer was #{answer}"
        print_board(guessed_so_far, wrong_guesses, lives, true)
    else
        puts "YOU LOSE! The answer was #{answer}"
        print_board(guessed_so_far, wrong_guesses, lives, true)
        game_over = True
    end
end


def print_board(guessed_so_far, wrong_guesses, lives, do_not_clear=false)
    if !do_not_clear
        system("cls")
    end
    puts guessed_so_far
    puts "WRONG GUESSES: #{wrong_guesses.upcase}"
    puts "LIVES: #{lives}"
end

system("cls")
answer, guessed_so_far = choose_word()
puts answer
puts guessed_so_far
lives = 6
wrong_guesses = ''
print_board(guessed_so_far, wrong_guesses, lives)
game_over = 

guess = make_guess(answer, guessed_so_far, wrong_guesses, lives, game_over)
puts "You guessed #{guess}"