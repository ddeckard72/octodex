require "pry"
require "./human"
require "./random"
require "./counting"
require "./smart"

class GuessingGame
  def initialize(player)
    @player = player
  end

  def play
    result = nil
    number = rand(1..100)
    guess = @player.get_guess(result)
    count = 1

    until guess == number
      if guess > number
        puts "#{guess} was too High!"
        result = "High"
      else
        puts "#{guess} was too Low!"
        result = "Low"
      end
      guess = @player.get_guess(result)
      count += 1
    end
    puts "You win! Took #{count} tries. The number was #{number}."
  end
end

game = GuessingGame.new(SmartPlayer.new)
game.play
#binding.pry

puts "just screwing around"