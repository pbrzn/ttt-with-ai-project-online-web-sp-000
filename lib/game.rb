class Game
  attr_accessor :player_1, :player_2, :board, :token
  
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
    
  def current_player
    board.turn_count%2==0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      if combo.all? {|index| self.board.cells[index]=="X"} || combo.all? {|index| self.board.cells[index]=="O"}
        combo
      else
        false
      end
    end
  end
  
  def draw?
    if self.board.full? && !self.won?
      true
    else
      false
    end
  end
  
  def over?
    true if self.draw? || self.won?
  end
  
  def winner
    if won?
      self.board.cells[won?[0]]
    end
  end
  
  def turn
    puts "Please enter a number 1-9"
    input=current_player.move(board)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
    elsif !self.board.valid_move?(input)
      turn
    end
    self.board.display
  end
  
  def play
    turn while !self.over?
    if self.won?
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end