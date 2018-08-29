require_relative "piece"

class Board
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) do 
      Array.new(8) {Piece.new(pos=[],type="rogue",color="black")}
    end 
    
  end 
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end 
  
  def []=(pos,piece)
    row,col = pos
    
    @grid[row][col] = piece
  end 
  

  
  def move_piece(start_pos,end_pos)
    
    moved_piece = self[start_pos] #self[start_pos] #able to access and update using @grid. WHY NOT.
    self[end_pos] = moved_piece
    p "self[start_pos]: #{self[start_pos]}"
    self[start_pos] = []
    
    p "self[start_pos]: #{self[start_pos]}"
  end 
  
  def valid_pos?
    
    
  end
  
  def play
    
    # until true
    # 
    # 
    # 
    # 
    # end
    # 
  end
  
end 


if $PROGRAM_NAME ==__FILE__
  Board.new.initialize
  Display.new.initialize
  
end 