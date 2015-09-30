require "pry"

class GuessingGame
	def initialize(player)
		@player = player
		
	end

	def play
		number = rand(1..100)
		guess = @player.get_guess
		count = 1
		result = ""
		until guess == number
			if guess > number
				puts "#{guess} is too High!"
				result = "High"
			else
				puts "#{guess} is too Low!"
				result = "Low"
			end 
			guess = @player.get_guess
			count += 1
		end
		puts "The number was #{number}"
		puts "You win! Took #{count} tries."
	end
end

class HumanPlayer
	def get_guess
		puts "Please guess a number: "
		guess = gets.chomp.to_i
			until guess != 0
				puts "Please guess a positive number."
				guess = gets.chomp.to_i
			end
		guess 
	end
end 

class RandomPlayer
	def get_guess
		rand(1..100)
	end
end

class CountingPlayer
	def initialize
		@count = 0
	end

	def get_guess
		@count += 1
	end
end

game = GuessingGame.new(RandomPlayer.new)
game.play
