
require "./lib/secret.rb"
require "./lib/hit.rb"
require "./lib/game.rb"

class Guess
  attr_reader :player_guess
  attr_reader :wrong_position
  
  def initialize(secret, cpu_game, computer_guess = [], wrong_position = nil)
    @cpu_game = cpu_game
    @colors = secret.colors
    print "\nOptions colors #{@colors}"
    @player_guess = []
    @computer_guess = computer_guess || []
    @color_secret = secret.secret_colors
    @wrong_position = wrong_position
  end

  def attempt_guess
    return @computer_guess if @cpu_game
    @player_guess
  end

  def guess_choose
    while @player_guess.size < 4
      print "\nChoose your guess:\n"
      @secret_guess = gets.chomp.downcase.strip
      if valid? 
        @player_guess << @secret_guess
      else
        print "Invalid choose"
      end
    end
  end

  def execute
    return computer_choose if @cpu_game
    guess_choose
  end

  def computer_choose
    if @computer_guess == []
      while @computer_guess.size < 4 
        @computer_guess << @colors.sample
      end
      return @computer_guess
    end 

    @computer_guess = @computer_guess.map.with_index do |value, index|
      if value == @color_secret[index]
        next value

      elsif @wrong_position == @color_secret[index]
        next @wrong_position

      elsif @color_secret.include?(value)
        @wrong_position = value
      else
        @colors.sample
      end
    end
  end

  def valid?
    @colors.include?(@secret_guess)
  end
  
end
