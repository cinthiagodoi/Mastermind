require "./lib/game.rb"
require "./lib/guess.rb"

class Secret
  attr_reader :colors
  attr_reader :secret_colors
  
  def initialize(cpu_game)
    @cpu_game = cpu_game 
    @colors = ["red", "blue","green", "yellow", "pink", "orange"] 
    @secret_colors = []
  end

  def execute_selection
    if @cpu_game
      print "Color options: #{@colors}\n"
      while @secret_colors.size < 4
        print "Choose your secret\n"
        @user_secret = gets.chomp.downcase.strip
        if valid?
          @secret_colors << @user_secret
        else 
          print "Invalid Choose\n"
        end
      end
    else
      @secret_colors = @colors.sample(4)
    end
    @secret_colors
  end

  def valid?
    @colors.include?(@user_secret)
  end  
end
