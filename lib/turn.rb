class Turn
  def initialize
    @over = false
    @points = 0
  end
  

  def turn_over?
    @over
  end

  def roll(die)
    @roll = die.toss
    @over = true
  end

  def roll_value
    @roll
  end
  


  def result
    if result_of_roll == [5]
      "Yacht!"
    elsif result_of_roll == [1,4]
      "Quads!"
    elsif result_of_roll == [2,3]
      "Full House!"
    elsif result_of_roll == [1,1,1,1,1] && @roll[4] - @roll[0] == 4
      "Straight!"
    else
      "Zero!"
    end
  end

  def points
    if result_of_roll == [5]
      50
    elsif result_quad 
      @roll[1] * 4
    elsif result_of_roll == [2,3]
      25
    elsif result_straight == true
      40
    else
      0
    end
  end


  private

  def result_of_roll
    @roll.uniq.map { |number| @roll.count(number) }.sort
  end

  def result_quad
    if result_of_roll == [1,4]
      @roll.sort
    end
  end

  def result_straight
    if result_of_roll == [1,1,1,1,1] && @roll[4] - @roll[0] == 4
      true
    end
  end
end



  # def points
  #   if yacht
  #     @points = 50
  #   end
  # end

