require 'rspec'
require 'player'

describe Player do 
  it 'initializes a player in the game' do 
  player = Player.new("Player1")
  player.should be_an_instance_of Player
  end

   it 'tells you the players name' do
    player = Player.new("Steve")
    player.name.should eq "Steve"
  end
end
 


  
