require 'rspec'
require 'turn'
require 'die'

describe Turn do 
  it 'initializes an instance of turn' do 
    turn = Turn.new
    turn.should be_an_instance_of Turn
  end

  context '#over?' do
    it 'is false at first' do 
      turn = Turn.new
      die = Die.new
      die.toss

      turn.turn_over?.should be_false
    end

    it 'is true after a roll of the five dice' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return(2,3,4,4,4)

      turn.roll(die)
      turn.turn_over?.should be_true
    end
  end

  context '#result' do 
    it 'returns "yacht" if you roll five of the same dice' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([3,3,3,3,3])

      turn.roll(die)
      turn.result.should eq "Yacht!"
    end

    it 'returns "quads" if you roll four of the same dice' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([4,4,4,4,1])

      turn.roll(die)
      turn.result.should eq "Quads!"
    end

    it 'returns "full house" if you roll a set of three of the same dice and a pair' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([1,1,3,3,3])

      turn.roll(die)
      turn.result.should eq "Full House!"
    end

    it 'return "straight" if you roll five sequential numbers' do
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([1,2,3,4,5])

      turn.roll(die)
      turn.result.should eq "Straight!"
    end

    it 'return "no points" if you roll any other combo of numbers' do
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([2,2,3,4,6])

      turn.roll(die)
      turn.result.should eq "Zero!"
    end


  end 

  context '#points' do 
    it 'it returns "50 points" for a yacht roll' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([2,2,2,2,2])

      turn.roll(die)
      turn.points.should eq 50
    end

    it 'it returns "the sum of the four of a kind" for a quad roll' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([1,2,2,2,2])

      turn.roll(die)
      turn.points.should eq 8
    end

    it 'it returns "25" for a full house roll' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([1,1,2,2,2])

      turn.roll(die)
      turn.points.should eq 25
    end
    
    it 'it returns "40" for a straight roll' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([2,3,4,5,6])

      turn.roll(die)
      turn.points.should eq 40
    end  
  
    it 'it returns "0" for a roll of any other combo' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([1,3,3,5,6])

      turn.roll(die)
      turn.points.should eq 0
    end
  end

  context '#roll_value' do 
    it 'returns array of numbers generated by roll method' do 
      turn = Turn.new
      die = double
      die.stub(:toss).and_return([1,3,3,5,6])

      turn.roll(die)
      turn.roll_value.should eq [1,3,3,5,6]
    end
  end

end