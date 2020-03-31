
class CpuPlay
  attr_reader :cpu_guess

  def initialize(secret, guess, last_hit)
    @secret = secret
    @colors = secret.colors
    @cpu_guess = guess
    @hit = last_hit
    @wrong_positions = []
    cpu_play
  end

  def cpu_play
    if @hit == []
      while @cpu_guess.size < 4
        @cpu_guess << @colors.sample
      end
    else 
      @cpu_guess = @cpu_guess.map.with_index do |value, index|
        if @hit[index] == "o"
          value 
        elsif @hit[index] == nil
          @colors.sample 
        else
          @wrong_positions << [value, index]
          value
        end
      end
      @wrong_positions.each do |color, wrong_index|
        ((0..3).to_a - [wrong_index]).each do |i|
          @cpu_guess[i], @cpu_guess[wrong_index] = @cpu_guess[wrong_index], @colors.sample if @hit[i] != 'o'
        end
      end
    end
    @cpu_guess
  end
end