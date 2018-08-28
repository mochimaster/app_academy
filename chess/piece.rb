require_relative "board.rb"
class Piece
  
  def initialize(player, position) #:x,[0,0]
    @grid = grid
    @pos = pos
  end 
  
  def [](pos)
    row, col = pos
    grid[row][col]
  end 
  
  def []=(pos)
    grid[row][col] = pos
  end 
  
  def move_piece()
    
  end 
end 