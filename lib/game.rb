require "./lib/hit.rb"
require "./lib/guess.rb"

class Game
  attr_reader :secret_selector
  
  
  def initialize
    @attempts = 0
    @cpu_game =  ''
    choose_secret_selector 
  end

  def choose_secret_selector
    print "Would you like to choose the secret? (Y/N): "
    @cpu_game = gets.chomp.downcase.strip == 'y'
    @secret = Secret.new(@cpu_game)
    @secret.execute_selection
  
    run 
  end


  def run
    computer_guess = []
    wrong_position = ''
    while @attempts <= 12
      @guess = Guess.new(@secret, @cpu_game, computer_guess, wrong_position)
      computer_guess = @guess.execute
      wrong_position = @guess.wrong_position
      check_guess
      @attempts += 1
    end
  end

  def check_guess
    hit = Hit.new(@secret, @guess)
    print "Your hit: #{hit.compare_chooses}"
    if @secret.secret_colors == @guess.attempt_guess
      print "You discovered the secret"
      @attempts = 13
    elsif @attempts == 12
      print "You lose!"
    end
  end

end


  


  

 
    
   
  
