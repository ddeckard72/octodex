r = rand(1..100)
r = r.to_i
done = false
while done == false
puts r 
puts "Guess which number I'm guessing from 1-100. (q)uit :"
guess = gets.chomp
	if guess.downcase == "q"
		done = true
	elsif guess.to_i == r 
		puts "Yes, #{r} was the correct number."
		done = true
	elsif guess.to_i > r 
		puts "A bit too high."
	else
		puts "A bit too low."
	end
end

