require 'rspec'
require 'game'

describe Game do 
  it 'tells us the game is not over' do 
    game = Game.new
    game.game_over?.should eq false
  end


  # context '#game_over?' do 
  #   it 'tells us the game is over after 13 turns' do 
  #     turn = double
  #     Turn.stub(:new).and_return(turn)
  #     turn.should_receive()

  #     game = Game.new
  #     game.game_over?

  #   end
  # end
end