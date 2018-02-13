# Word_Guess Project
# require "pry"
class WordGuess
  attr_reader :word_array, :display_array, :word_string
  # use faker to get a word or word bank
  def initialize(word)
    @word_array = word.split("")
    @display_array = Array.new(word.length, "_")
    @flowers = Array.new(5, "<3")
    @user_guesses = []
    @word_string = word
  end

  def print_display
    display = ""
    @display_array.each do |letter|
      display += "#{letter} "
    end
    return display
  end

  def print_picture
    return @flowers
  end

  def check_guess(user_input)
    if @word_array.include?(user_input)
      @word_array.each_with_index do |letter, i|
        if user_input == letter
          @display_array[i] = letter
        end
      end
    else
      @flowers.delete_at(-1)
    end
    @user_guesses << user_input

    if won?
      puts "YOU WIN! Congratulations!"
    end

    if lost?
      puts "YOU LOSE. Sorry :("
    end
  end

  def check_word_guess(user_input)
    if user_input == @word_string
      @display_array = @word_array
    end

    if won?
      puts "YOU WIN! Congratulations!"
    end

  end

  def won?
    if @display_array == @word_array
      return true
    else
      return false
    end
  end

  def lost?
    if @flowers.length == 0
      return true
    else
      return false
    end
  end

  def user_guesses
    return @user_guesses
  end



end

# guesses = []
#
# test = WordGuess.new("sitting")
# puts test.print_display
# puts test.print_picture
#
# puts "Guess a letter:"
# input = gets.chomp
# test.check_guess(input)
# puts test.print_display
# puts test.print_picture
# puts test.won?
# puts test.lost?
#


def update(game)
  puts "Status".center(20,"=")
  if !(game.won?) && (!game.lost?)
    puts game.print_display
    puts game.print_picture
    puts game.user_guesses
  end

end

def is_a_letter?(input)
  input =~ /[a-z]/
end

word_bank = %W[watermelon taco seattle]

puts "Welcome to the Flower Word Game!"
puts "\nDirections: Guess one letter at a time to try to solve the word puzzle. You will see an updated display after each turn. If you run out of hearts, you lose the game! Good luck!!!\n"

flag = true
while flag
  new_game = WordGuess.new(word_bank.sample)
  update(new_game)
  until new_game.won? || new_game.lost?
    puts "Guess a letter: "
    guess = gets.chomp.downcase


    until (guess.length == 1 || guess.length == new_game.word_string.length) && is_a_letter?(guess) && !new_game.user_guesses.include?(guess)

      if guess.length == new_game.word_string.length
         new_game.check_word_guess(guess)
      end

      if new_game.user_guesses.include?(guess)
        puts "You've already tried #{guess}. Please enter another letter: "
        guess = gets.chomp.downcase

      else
        puts "Sorry! Please enter only one letter: "
        guess = gets.chomp.downcase

      end

    end



    puts "=======checking======"
    new_game.check_guess(guess)
    update(new_game)

  end

  puts "Would you like to play another game? (yes/no)"
  user_decision = gets.chomp.downcase
  if user_decision == "yes"
    flag = true
  else
    flag = false
  end
end

puts "Thanks for playing our awesome word game!! :)"










#
