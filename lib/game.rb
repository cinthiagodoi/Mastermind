require "./lib/hit.rb"
require "./lib/user_play.rb"
require "./lib/cpu_play.rb"

class Game
  attr_reader :secret_selector
  attr_reader :guess
  
  
  def initialize
    @attempts = 0
    @select_player = ''
    @last_hit = []
    @guess = []
    who_plays
   
  end

  def who_plays
    print "Would you like to choose the secret? (Y/N): "
    
    @select_player = gets.chomp.downcase.strip == 'y'
    @secret = Secret.new(@select_player)
    @secret_colors = @secret.execute_selection
  
    run 
  end

  def run
    
    while @attempts <= 12
      if @select_player
        @cpu_play = CpuPlay.new(@secret, @guess, @last_hit)
        @guess = @cpu_play.cpu_guess
      else
        @user_play = UserPlay.new(@secret)
        @guess = @user_play.user_guess
      end
      @hit = Hit.new(@secret, @guess)
      @last_hit = @hit.compare_chooses
      check_guess
      @attempts +=1 
    end
  end


  def check_guess
    print "\nYour hit: #{@last_hit}\n"
    if @secret_colors == @guess
      print "\nYou win!\n"
      @attempts = 13
    elsif @attempts == 12
      print "\nYou lose!\n"
    end
  end

  

end


  


  

 
    
   
  
