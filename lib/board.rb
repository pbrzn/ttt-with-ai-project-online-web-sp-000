class Board
  attr_accessor :cells
  
  @cells=[]
  
  def reset!
    @cells=Array.new(9, " ")
  end
  
  def initialize
    reset!
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(input)
    cells[input.to_i-1]
  end
  
  #---Fix #update to maintain DRY principle---#
  
  def update(input, player)
    cells[input.to_i-1] = player.token
    self.cells
  end
  
  def full?
    self.cells.all? {|cell| cell!=" "}
  end
  
  def turn_count
    count=0
    self.cells.each {|cell| count+=1 if cell!=" "}
    count
  end
  
  def taken?(input)
    cell=self.position(input)
    if cell=="X" || cell=="O"
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    true if input.to_i>=1 && input.to_i<=9 && !self.taken?(input)
  end
end
    