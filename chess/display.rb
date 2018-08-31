require "colorize.rb"
require_relative "cursor.rb"
require_relative "board.rb"
 

class Display
  attr_reader :cursor, :board
  
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
    @board =  board
  end 
  
  

  def render
     #puts "  #{(0..8).to_a.join(' ')}"
    @board.grid.each_with_index do |row, i|
         
      @board.grid.each_with_index do |col,j|
         if i == @cursor.cursor_pos[0] && j == @cursor.cursor_pos[1]
           print "#{[         ]}".colorize(:background =>:green)
         elsif i.even? && j.even?
           print "#{[         ]}".colorize(:background =>:red)
         elsif i.even? && j.odd?
           print "#{[         ]}".colorize(:background =>:blue)
         elsif i.odd? && j.even? 
           print "#{[         ]}".colorize(:background =>:blue)
         elsif i.odd? && j.odd?
           print "#{[         ]}".colorize(:background =>:red)
         end 
      end 
      puts " "
    end
    
  end
  

  
end 

if __FILE__ == $PROGRAM_NAME
  b_obj = Board.new
  d_obj = Display.new(b_obj)
  
  while true
    d_obj.render
    begin
      d_obj.cursor.get_input
    rescue ArgumentError => e
      p "Error was #{e.message}. Please input a valid move."
      retry
    end
    
  end
end
  