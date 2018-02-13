# Word_Guess Project
require "colorize"
require "spicy-proton"

class WordGuess
  attr_reader :word_array, :display_array, :word, :user_guesses
  # use faker to get a word or word bank
  def initialize
    @word = Spicy::Proton.noun(min:5)
    @word_array = word.split("")
    @display_array = Array.new(word.length, "_")
    @candles = Array.new(5, ",")
    @user_guesses = []
    @cake = "\t   _|||||_ \n\t  {~*~*~*~}\n\t__{*~*~*~*}__\n\t-------------"
  end

  def display
    display = "\n The word to guess: "
    @display_array.each do |letter|
      display += "#{letter} "
    end
    return display
  end

  def easy
    @word_array.each_with_index do |letter, i|
      if %W[a e i o u].include?(letter)
        @display_array[i] = letter
      end
    end
  end

  def normal
    @display_array[0] = @word_array[0]
    @display_array[-1] = @word_array[-1]
  end

  def picture
    picture = "\t    "
    @candles.each do |flame|
      picture += "#{flame}".colorize(:red)
    end
    picture += "\n#{@cake}"
    return picture
  end

  def check_guess(user_input)
    # Case 1: user guess a word
    if user_input.length > 1
      if user_input == @word
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
      return "Congralations! YOU WIN!!! \nThe word was: #{@word.upcase.colorize(:blue)}\n\n             🍴 🍰\n#{@cake.gsub("|", "_")}\n\nYou get to eat the cake!\n\n"
    elsif lost?
      return "\n\nYou LOSE! Sorry 😢  😢  😢  😢  😢\n\n#{@cake} \nThe word was: #{@word.upcase.colorize(:red)} "
    else
      return nil
    end
  end

  def won?
    @display_array == @word_array
  end

  def lost?
    @candles.length == 0
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
    puts game.display
    puts game.picture
    puts game.user_guesses
  end
end

def is_a_letter?(input)
  input =~ /[a-z]/
end

puts "Our Word Game is a piece of cake!".center(40, "=")
puts "\nDirections: Guess one letter or the entire word at a time to try to solve the word puzzle. Each wrong guess will extinguish one candle one the cake. But if you guess the word before they all do, you get to eat the cake! Good luck!!!\n\n"

flag = true

while flag
  # User choose level
  levels = %W[Easy Normal Hard]
  puts "Level".center(40, "=")
  puts "Please choose difficulty level: #{levels[0]} #{levels[1]} #{levels[2]}"

  user_level = gets.chomp.downcase.capitalize
  until levels.include?(user_level)
    puts "Oops! Please choose a level: #{levels[0]} #{levels[1]} #{levels[2]}"
    user_level = gets.chomp.downcase.capitalize
  end

  new_game = WordGuess.new

  # Modify display for different levels
  case user_level
  when "Easy"
    new_game.easy
  when "Normal"
    new_game.normal
  end

  # Display beginning
  status(new_game)

  until new_game.game_over?
    puts "Guess a letter: "
    guess = gets.chomp.downcase

    until is_a_letter?(guess) && !(new_game.guessed?(guess)) && (guess.length == 1 || guess.length == new_game.word.length)

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
  if user_decision != "yes"
    flag = false
  end

end # Flag loop

puts "Thanks for playing our awesome word game!!! 😃"










#
