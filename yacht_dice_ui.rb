require 'rspec'
require 'game'
require 'player'
require 'turn'
require 'die'


puts "Welcome to Yacht Dice!"

players = [Player.new("Player1"), Player.new("Player2")]
game = Game.new
die = Die.new

until game.game_over?
  players.each do |player|
    "#{player.name} it is your roll."
    turn = Turn.new

    until turn.turn_over?
      puts "#{player.name} press enter to roll your dice."
      gets.chomp
      turn.roll(die)
      puts "You rolled a #{turn.roll_value.sort}"
      turn.result
      puts "#{player.name} you rolled a #{turn.result}"
      turn.points
      puts "You get #{turn.points} for this turn."
    end
  end
  
end