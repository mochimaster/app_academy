require "io/console"
require 'byebug'

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end
  


  def handle_key(key)

    
    p key
    p "current pos: #{cursor_pos}"
    case MOVES.keys.include?(key) || KEYMAP.values.include?(key) 
    when key == :left || key == "h"
      update_pos(key)
    when key == :right
      update_pos(key)
    when key == :up
      update_pos(key)
    when key == :down
      update_pos(key)
    when key == :space 
      p "#{@cursor_pos}"
    when key == :return
      p "#{@cursor_pos}"
    when key == :ctrl_c
      Process.exit(0)
      
    end     
    p "After pos: #{cursor_pos}"
  end

  def update_pos(key)
    
    case true
    when key == :left
      y_diff = @cursor_pos[1] - (-1).abs
      
      p  valid_move?(@cursor_pos[0],y_diff)
      if valid_move?(@cursor_pos[0],y_diff)
        @cursor_pos = [cursor_pos[0],y_diff]
      else 
        raise ArgumentError
      end
    
    when key == :right
      y_diff = @cursor_pos[1] + 1
      
      if valid_move?(@cursor_pos[0],y_diff)
        @cursor_pos = [cursor_pos[0],y_diff]
      else
        raise ArgumentError
      end
      
    when key == :up
      x_diff = @cursor_pos[0] - (-1).abs
      
      if valid_move?(x_diff,cursor_pos[1]) 
        @cursor_pos = [x_diff,cursor_pos[1]]
      else
        raise ArgumentError
      end
      
    when key == :down
      x_diff = @cursor_pos[0] + 1
      
      if valid_move?(x_diff,cursor_pos[1]) 
        @cursor_pos = [x_diff,cursor_pos[1]] 
      else
        raise ArgumentError
      end

    end     
  end
  
  def valid_move?(*pos)
    #debugger
    p "we are evaluating pos[1] < 0:#{pos[1] < 0} at#{pos}"
    p "we are evaluating pos[0] > 0:#{pos[0] > 0} at#{pos}"
    if pos[1] < 0  || pos[1] > 7
      return false 
    elsif pos[0] < 0 || pos[0] > 7
      return false
    else 
      true
    end  
  end 
end