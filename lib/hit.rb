require "./lib/game.rb"
require "./lib/secret.rb"
require "./lib/guess.rb"

class Hit
  
  def initialize(secret, guess)
    @color_secret = secret.secret_colors
    @choose_secret = guess.attempt_guess
  end

  def compare_chooses
    @removed_equals = @choose_secret.zip(@color_secret).map {|a, b| a if a != b }
    @removed_equals.map! do |v| 
      next 'x' if @color_secret.include?(v)
      next 'o' if v == nil
      nil 
    end
  end

end