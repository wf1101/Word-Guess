# Word_Guess Project

class WordGuess
  attr_reader :word_array, :display_array
  # use faker to get a word or word bank
  def initialize(word)
    @word_array = word.split("")
    @display_array = Array.new(word.length, "_")
    @flowers = Array.new(5, "<3")
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



end

test = WordGuess.new("sitting")
puts test.print_display
puts test.print_picture

puts "Guess a letter:"
input = gets.chomp
test.check_guess(input)
puts test.print_display
puts test.print_picture








#
