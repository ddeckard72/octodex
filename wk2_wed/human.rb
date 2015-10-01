#human.rb
#has_coffee?
#needs_coffee?
#alertness
#drink!
#buy

class Human
	def initialize(name)
		@alertness = 0.03
		@coffee =  nil
		@name = name
	end

	def has_coffee?
		@coffee
	end

	def needs_coffee?
		!@coffee
	end

	def drink!
		# takes away coffee and raises alertness by .33
		@alertness += 0.33
	end

	def buy(coffee)
		coffee.sell
		@coffee = coffee 
	end

	def alertness
		@alertness
	end
end
