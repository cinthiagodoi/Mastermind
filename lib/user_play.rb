require "./lib/secret.rb"

class UserPlay
  attr_reader :user_guess

  def initialize(secret)
    @colors = secret.colors
    @user_guess = []
    @color_secret = secret.secret_colors
    guess_choose
  end

  def guess_choose
    while @user_guess.size < 4
      print "\nChoose your guess:\n"
      @secret_guess = gets.chomp.downcase.strip
      if valid? 
        @user_guess << @secret_guess
      else
        print "Invalid choose"
      end
    end
  end

  def valid?
    @colors.include?(@secret_guess)
  end
  
end
