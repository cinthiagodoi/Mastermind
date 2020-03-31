require "./lib/game.rb"

class Secret
  attr_reader :colors
  attr_reader :secret_colors
  
  def initialize(select_player)
    @select_player = select_player
    @colors = ["red", "blue","green", "yellow", "pink", "orange"] 
    @secret_colors = []
  end

  def execute_selection
    print "Color options: #{@colors}\n"
    while @secret_colors.size < 4
      if @select_player
        print "Choose your secret\n"
        @user_secret = gets.chomp.downcase.strip
        if valid?
          @secret_colors << @user_secret
        else 
          print "Invalid Choose\n"
        end
      else
        @secret_colors << @colors.sample
      end
    end
    @secret_colors
  end

  def valid?
    @colors.include?(@user_secret)
  end  
end
