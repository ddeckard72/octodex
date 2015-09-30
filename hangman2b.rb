require "pry"
require "set"

word_list = [
  "chicken", "duck", "dog", "cat", "clown",
  "brick", "bananas", "totalitarianism",
  "coffee", "metacircular", "interpreter",
  "wednesday", "ruby", "evaluation", "consternation",
  "chicanery"
]
player1 = "Dude"
player2 = "Sweet"

MAX_TURNS = 6
answer = word_list.sample

def greeting
  puts "Welcome to the game of Hangman!\n\n"
  puts "I'm not even gonna explain it."
  puts "Just guess letters dummy."
end

def game_over?(answer, guesses)
  turns_left(guesses, answer).zero? || win?(answer, guesses)
end

def show_progress(partial_word, answer, guesses)
  turns_remaining = turns_left(guesses, answer)
  puts "----------------------------------------------"
  puts 
  puts "The current word is: #{partial_word}"
  puts "You have #{turns_remaining} guesses left."
end

def prompt_player(current_player)
  puts
  puts "Please guess a letter #{current_player}: "
  letter = gets.chomp

  until ('a'..'z').to_a.include?(letter)
    puts "#{letter} is not a single lowercase letter. Please guess again #{current_player}: "
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
      "-"
    end
  end
end

def take_turn(guesses, answer,current_player)
  partial_word = make_partial(guesses, answer).join
  show_progress(partial_word, answer, guesses)
  prompt_player(current_player)
  
end

def win?(answer, guesses)
  answer_set = answer.chars.to_set
  # guesses.superset?(answer_set)
  guesses >= answer_set
end

def postmortem(answer, guesses,current_player)
  if win?(answer, guesses)
    puts "Nice work #{current_player}! You win."
  else
    puts "The word was #{answer}. Better luck next time."
  end
end

def turns_left(guesses, answer)
  answer_set = answer.chars.to_set
  wrong_guesses = (guesses - answer_set).count
  # wrong_guesses = guesses.difference(answer_set).count
  MAX_TURNS - wrong_guesses
end

def get_player_name(player)
  puts "What's your name player #{player}? "
  gets.chomp
end

def hangman(answer,player1,player2)
  p1_guesses = Set.new
  p2_guesses = Set.new

  greeting
  current_turns = MAX_TURNS
  current_player = player1
  current_guesses = p1_guesses

  until game_over?(answer, current_guesses)
    #toggle player
    if current_player == player1 && (turns_left(current_guesses,answer < current_turns))
      current_player = player2
    else
      current_player = player1
    end

    if current_guesses == p1_guesses && (turns_left(current_guesses,answer < current_turns))
      current_guesses = p2_guesses
    else
      current_guesses = p1_guesses
    end
    current_turns = turns_left(current_guesses,answer)
    guess = take_turn(current_guesses, answer,current_player)
    current_guesses.add(guess)
    # if number of turns when down then switch players

  end
  postmortem(answer, current_guesses,current_player)
end

def play_again?
  puts "Would you like to play again? (y/n)"
  gets.chomp
end

def play_hangman(words,player1,player2)
  player1 = get_player_name(1)
  player2 = get_player_name(2)

  answer = words.sample
  hangman(answer,player1,player2)
end

def play(words,player1,player2)
  play_hangman(words,player1,player2)
  choice = play_again?
  until choice == "n"
    play_hangman(words,player1,player2)
    choice = play_again?
  end
end

play(word_list,player1,player2)