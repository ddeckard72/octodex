require "pry"
require "set"

board = (1..9).to_a
player1 = ""
player2 = ""
game_mode = "E"

#Winning!
	WINSET =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def greeting
	puts
	puts "Time to play some tic tac toe."
end

def show_board(board)
	puts "
	#{board[0]} | #{board[1]} | #{board[2]}
	#{board[3]} | #{board[4]} | #{board[5]}
	#{board[6]} | #{board[7]} | #{board[8]}
	"
end

def prompt_player(current_player)
	puts "#{current_player} you're up."
	puts "Choose a square (1 - 9)"
	choice = gets.chomp
	 until ('1'..'9').to_a.include?(choice)
    puts "#{choice} is not a valid choice. Please guess again #{current_player}: "
    choice = gets.chomp
  	end
  	choice
end 

def prompt_computer

end

def prompt_evil_computer

end

def prompt_nightmare_computer

end

def is_occupied(position)
	board[position-1] == "X" || "O"
end

def available_moves(board)
  board.reject { |x| x.is_a?(String) }
end

def get_mode
	# todo: Have the user pick the game mode
	puts "(e)asy - Human vs. Human"
	puts "(n)ormal - Human vs. Computer"
	puts "(h)ard - Human vs. Evil Computer"
	puts "n(i)ghtmare - Human vs. Really Evil Computer"
	puts "Select game mode:"
	gets.chomp.upcase

end

def take_turn(current_player,game_mode,board)
	#select function based on mode
	case game_mode
	when "E"
		prompt_player(current_player)
	when "N"
		if current_player == "Computer"
			prompt_computer(board)
		else
			prompt_player(current_player)
		end if
	when "H"
	when "I"
	else
		error
	end
end

def get_player_name(player)
	puts "What's your name player #{player}? "
	gets.chomp
end

def postmortem(board,current_player)
	if iswin?(board)
		puts "#{current_player} wins!"
	else
		puts "It's a draw!"
	end
	puts
	puts "Thanks for playing."
end

def game_over?(board,move_count)
# if win or board full 
	if move_count == 9
		we_are_done = true
	elsif iswin?(board)
		we_are_done = true
	end

we_are_done
end 

def draw?(board)
  available_moves(board).empty?
end

def iswin?(board)
	  WINSET.any? do |x, y, z|
    	board[x] == board[y] && board[y] == board[z]
  end
	#binding.pry
end

def tictactoe(board,player1,player2,game_mode)
	move_count = 0
	current_player = player2

  until game_over?(board,move_count)
    #toggle player
    # todo: don't toggle players if not in easy mode
	current_player = current_player == player1 ? player2 : player1
  
	show_board(board)
    move = take_turn(current_player,game_mode,board)
  
    if current_player == player1
    	board[move.to_i - 1] = "X" 	
    else
    	board[move.to_i - 1] = "O"
    end 
    move_count += 1
  end
  show_board(board)
  postmortem(board,current_player)
end

def play_again?
	puts "Would you like to play again? (y/n)"
	gets.chomp
end

def play_tictactoe(board,player1,player2,game_mode)
	greeting
	#get mode(game_mode)
 	player1 = get_player_name(1)
 	if game_mode == "E"
 		player2 = get_player_name(2)
 	else
 		player2 = "Computer" 
 	end 
	board = (1..9).to_a
 	
 	tictactoe(board,player1,player2,game_mode)
end

def play(board,player1,player2,game_mode)
  play_tictactoe(board,player1,player2,game_mode)
  choice = play_again?
  until choice == "n"
    play_tictactoe(board,player1,player2,game_mode)
    choice = play_again?
  end
end 

play(board,player1,player2,game_mode) 

