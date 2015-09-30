require "pry"
require "set"

word_list = [
  "chicken", "duck", "dog", "cat", "clown",
  "brick", "bananas", "totalitarianism",
  "coffee", "metacircular", "interpreter",
  "wednesday", "ruby", "evaluation", "consternation",
  "chicanery"
]
finished_playing = false
MAX_TURNS = 6
answer = word_list.sample

def greeting
  puts "Welcome to the game of Hangman!\n\n"
  puts "I'm not even gonna explain it."
  puts "Just guess letters dummy."
end

def game_over?(answer, guesses)
  
  turns_left(guesses,answer).zero? || win?(answer,guesses)

end

def show_progress(partial_word, answer, guesses)
  turn_remaining = turns_left(guesses, answer)
  puts
  puts "The current word is: #{partial_word}"
  puts "You have #{turns_remaining} guesses left."
end

def prompt_player()
  puts
  puts "Please guess a letter: "
  letter =gets.chomp
  until ("a".."z").to_a.include?(letter)
    puts "#{letter} is either not a valid letter. Please guess again: "
    letter = gets.chomp
  end
  letter
end

def make_partial(guesses, answer)
  # blank a letter in the answer if it isn't in the guesses
  answer.chars.map do |letter|
    if guesses.include?(letter)
      letter
    else
      "_"
    end
  end
end

def take_turn(guesses, answer)
  partial_word = make_partial(guesses, answer).join
  show_progress(partial_word, answer, guesses)
  prompt_player()
end

def win?(answer, guesses)
  answer_set = answer.chars.to_set
  #guesses.superset?(answer_set)
  guesses >= answer_set
  #answer.chars.all? do |character|
  #  guesses.include?(character)
  #end

  # winner = true
  # answer.chars.each do |letter|
  #   winner = false unless guesses.include?(letter)
  # end
  # winner
end

def postmortem(answer, guesses)
  if win?(answer, guesses)
    puts "Nice work! You win."
  else
    puts "The word was #{answer}. Better luck next time."
  end
end

def turns_left(guesses,answer)
  answer_set = answer.chars.to_set
  wrong_guesses = guesses.difference(answer_set).count
  MAX_TURNS - wrong_guesses
end

def hangman(answer)
  guesses = Set.new
  greeting

  until game_over?(turn_count,answer,guesses)
    guess = take_turn(guesses, answer)
    guesses.add(guess)
    #turn_count -= 1 unless answer.include?(guess)
    #binding.pry 
  end
  postmortem(answer, guesses)
  
end

def startplaying(answer,word_list)
  finished_playing = false
  until finished_playing
    answer = word_list.sample
    hangman(answer)

  puts "Would you like to play again? "
  
    if gets.chomp == "n"
      finished_playing = true
    end  
  end
end

startplaying(answer, word_list)

