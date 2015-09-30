require "pry"

class SmartPlayer
	def initialize
		@low_point = 1
		@high_point = 100
		@guess = 50
		
	end

	def get_guess(result)
		#binding.pry
		if result == "High"
			@high_point = @guess
		elsif result == "Low"
			@low_point = @guess
		else
			@low_point = 1
			@high_point = 100
		end
		puts "#{@low_point} - #{@high_point}"
		@guess = rand(@low_point..@high_point)
		#binding.pry
		#@guess
	end
end