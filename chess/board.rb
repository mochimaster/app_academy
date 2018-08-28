
class Board
  attr_accessor :grid
  
  def initialize 
      @grid = Array.new(8) do 
      Array.new(8) {Piece.new()}
    end 
  end 
  
  def render
     #puts "  #{(0..8).to_a.join(' ')}"
    @grid.each_with_index do |row, i|
       @grid.each_with_index do |col,j|
         print"#{[]}"
      end 
      puts
    end
   end
  
end 






if $PROGRAM_NAME ==__FILE__
  Board.new.initialize
end 