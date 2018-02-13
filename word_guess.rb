# Word_Guess Project
# require "pry"
class WordGuess
  attr_reader :word_array, :display_array, :word_string, :user_guesses
  # use faker to get a word or word bank
  def initialize(word)
    @word_array = word.split("")
    @display_array = Array.new(word.length, "_")
    @candles = Array.new(5, ",")
    @user_guesses = []
    @word_string = word
    @cake = "\t   _|||||_ \n\t  {~*~*~*~}\n\t__{*~*~*~*}__\n\t-------------"
    @winner_cake = "\t   _______ \n\t  {~*~*~*~}\n\t__{*~*~*~*}__\n\t-------------"
  end

  def print_display
    display = "\n The word to guess: "
    @display_array.each do |letter|
      display += "#{letter} "
    end
    return display
  end

  def print_picture
    picture = "\t    "
    @candles.each do |flame|
      picture += "#{flame}"
    end
    picture += "\n#{@cake}"
    return picture
  end

  def check_guess(user_input)
    # Case 1: user guess a word
    if user_input.length > 1
      if user_input == @word_string
        @display_array = @word_array
      else
        @candles.delete_at(-1)
      end
      # Case 2: user guess one letter
    else
      if @word_array.include?(user_input)
        @word_array.each_with_index do |letter, i|
          if user_input == letter
            @display_array[i] = letter
          end
        end
      else
        @candles.delete_at(-1)
      end
    end

    @user_guesses << user_input
    game_over?
  end

  def game_over?
    if won?
      return "Congralations! YOU WIN!!! The word was: #{@word_string}\n\n#{@winner_cake}\n\nYou get to eat the cake!\n\n"
    elsif lost?
      return "\n\nYou LOSE! Sorry :(\n\n#{@cake}"
    else
      return nil
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
    if @candles.length == 0
      return true
    else
      return false
    end
  end

  def user_guesses
    return "You guesses so far: #{@user_guesses}"
  end


  def guessed?(user_input)
    @user_guesses.include?(user_input)
  end

end



def status(game)
  if !game.game_over?
    puts "Status".center(40,"=")
    puts game.print_display
    puts game.print_picture
    puts game.user_guesses
  end
end

def is_a_letter?(input)
  input =~ /[a-z]/
end

word_bank = %W[watermelon taco seattle]

puts "Our Word Game is a piece of cake!".center(40)
puts "\nDirections: Guess one letter or the entire word at a time to try to solve the word puzzle. Each wrong guess will extinguish one candle one the cake. But if you guess the word before they all do, you get to eat the cake! Good luck!!!\n"

flag = true

while flag
  new_game = WordGuess.new(word_bank.sample)
  status(new_game)

  until new_game.game_over?
    puts "Guess a letter: "
    guess = gets.chomp.downcase

    until is_a_letter?(guess) && !(new_game.guessed?(guess)) && (guess.length == 1 || guess.length == new_game.word_string.length)

      if new_game.guessed?(guess)
        puts "You've already tried #{guess}. Please enter another guess: "
        guess = gets.chomp.downcase

      else
        puts "Sorry! That's not a valid guess. Please enter another guess: "
        guess = gets.chomp.downcase
      end

    end

    puts new_game.check_guess(guess)
    status(new_game)

  end # Until loop

  puts "Would you like to play another game? (yes/no)"
  user_decision = gets.chomp.downcase
  if user_decision == "yes"
    flag = true
  else
    flag = false
  end

end # Flag loop

puts "Thanks for playing our awesome word game!! :)"










#
