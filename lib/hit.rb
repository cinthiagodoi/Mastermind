class Hit
  
  def initialize(secret, guess)
    @color_secret = secret.secret_colors
    @guess = guess
    
  end

  def compare_chooses
    @guess.map.with_index do |value, index|
      
      if value == @color_secret[index]
        "o"
      elsif @color_secret.include?(value) && @color_secret.select{|v| v == value}.size >= @guess.select{|v| v == value}.size 
        "x"
      else
        nil
      end
    end
  end

end