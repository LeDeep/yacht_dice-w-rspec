class Die
  attr_reader :toss

  def toss
    Array.new(5) { Kernel.rand(1..6) }
  end

  # def toss_value
  #   @toss.to_a 
  # end

end