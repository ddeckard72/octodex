#coffee.rb
#full?
#empty?

class Coffee
	def initialize(coffee_type)
		@coffee_level = 10
		@coffee_type = coffee_type
	end

	def full?
		@coffee_level == 10
	end

	def empty?
		@coffee_level == 0
	end

	def sell
		@coffee_level -= 1
	end 
end
