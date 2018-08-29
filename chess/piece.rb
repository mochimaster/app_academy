require "byebug"
require_relative "board.rb"
class Piece
  attr_accessor :pos
  
  def initialize(player="Juan",pos,type) #:x,[0,0]
     # @grid = grid
     @pos = pos
     @type = type
  end 

  def move(end_pos)
    
    self.pos = end_pos  
    self.pos
  end
  
  

  
end 