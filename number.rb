r = rand(1..10)
done = false

puts "Guess which number I'm guessing from 1-10. (q)uit :"
guess = gets.chomp
if guess.downcase == "q"
	done = true
elsif guess == r 
	puts "Yes, #{r} was the correct number."
	done = true
elsif guess > r 
	puts "A bit too high."
else
	puts "A bit too low."
end

