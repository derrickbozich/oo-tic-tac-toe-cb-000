class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

  def display_board
  puts " "+@board[0]+" "+"|"+" "+@board[1]+" "+"|"+" "+@board[2]+" "
  puts "-----------"
  puts " "+@board[3]+" "+"|"+" "+@board[4]+" "+"|"+" "+@board[5]+" "
  puts "-----------"
  puts " "+@board[6]+" "+"|"+" "+@board[7]+" "+"|"+" "+@board[8]+" "
end


def valid_move?(index)
  result = false
  if (index.to_i).between?(0,8) && (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    result = true
  end
  result
end


def move(index, token)
  #index = input_to_index(input)
  @board[index] = token
end


def input_to_index(input)
  index = (input.to_i)-1
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board

  else
    turn
  end
end

def current_player
  turn = turn_count
  result = (turn % 2 == 0 ? "X" : "O")
  result
end

def turn_count
  turns = 0
  @board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  turns
end

# Helper Method
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1
  [2,4,6] # Diagonal 2
  #["X","X","X"],

]

def won?
  WIN_COMBINATIONS.detect do |combos|
    @board[combos[0]] ==   @board[combos[1]] &&
    @board[combos[1]] ==   @board[combos[2]] &&
    position_taken?(combos[0])
  end
end

def full?
  @board.all? {|i| i == "X" || i == "O"}
end

def draw?
 full? && !won?

end

def over?
  won? || draw?
end

def winner
  result = nil
  if won?
    result = won?
    result = @board[result[0]]

  end
  result

end



def play
  while !over?
    turn
    draw?
  end

  if won?
    result = winner
    puts "Congratulations #{result}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
