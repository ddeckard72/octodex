require "pry"

class Cookie
	def eat
		puts "This is friggin awesome!"
	end	
end

class Student
	def initialize(first_name, last_name)
		@first = first_name
		@last = last_name
		@name = "#{first_name} #{last_name}"
	end

	def name
		@name
	end

	def name=(new_name)
		@name = new_name

	def does(a_thing)
		puts "#{@name} does #{a_thing}"
	end
end

