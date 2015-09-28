require "pry"
require "set"

board = (1..9).to_a
player1 = ""
player2 = ""
game_mode = "e"

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

=begin
def get_possible_moves
	open_spots = Array.new
	board.each do |a|
		if a != "X" && a != "O"
			open_spots.push(a)
		end 
	 end
end
=end

def get_mode
	# todo: Have the user pick the game mode
	puts "(e)asy - Human vs. Human"
	puts "(n)ormal - Human vs. Computer"
	puts "(h)ard - Human vs. Evil Computer"
	puts "n(i)ghtmare - Human vs. Really Evil Computer"
	puts "Select game mode:"
	gets.chomp

end

def take_turn(current_player)
	#select function based on mode
	case game_mode
	when "e"
		prompt_player(current_player)
	when "n"
	when "h"
	when "i"
	else
		error
	end
end

def get_player_name(player)
	puts "What's your name player #{player}? "
	gets.chomp
end

def postmortem(current_player,current_moves)
	if iswin?(current_moves)
		puts "#{current_player} wins!"
	else
		puts "It's a draw!"
	end
	puts
	puts "Thanks for playing."
end

def game_over?(board,move_count)
# if win or board full
we_are_done = false
if move_count > 2 
	if move_count == 9
		we_are_done = true
	elsif iswin?(board)
		we_are_done = true
	end
end 

we_are_done
end 

def iswin?(board)

	  WINSET.any? do |x, y, z|
    	board[x] == board[y] && board[y] == board[z]
  end
	#binding.pry
	
end

def tictactoe(board,player1,player2)
	p1_moves = Array.new
	p2_moves = Array.new
	move_count = 0
	current_player = player2
	current_moves = p2_moves


  until game_over?(board,move_count)
    #toggle player
    # todo: don't toggle players if not in easy mode
    if current_player == player1
      current_player = player2
      current_moves = p2_moves
    else
      current_player = player1
      current_moves = p1_moves
    end
	show_board(board)
    move = take_turn(current_player)
    current_moves.push(move)

    if current_player == player1
    	board[move.to_i - 1] = "X" 
    	
    else
    	board[move.to_i - 1] = "O"

    end 
    move_count += 1
  end
  show_board(board)
  postmortem(current_player,current_moves)
end

def play_again?
	puts "Would you like to play again? (y/n)"
	gets.chomp
end

def play_tictactoe(board,player1,player2)
	greeting
	#get mode(game_mode)
 	player1 = get_player_name(1)
 	player2 = get_player_name(2)
	board = (1..9).to_a
 	
 	tictactoe(board,player1,player2)
end

def play(board,player1,player2)
  play_tictactoe(board,player1,player2)
  choice = play_again?
  until choice == "n"
    play_tictactoe(board,player1,player2)
    choice = play_again?
  end
end 

play(board,player1,player2) 

