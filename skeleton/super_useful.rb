require 'byebug'
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "Please input a Fruit."
    e = ArgumentError.new ("From Juan and Kee")
    puts "Something went wrong: #{e.message}"
    # retry
  end 
  
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == "coffee" 
    e = ArgumentError.new ("Coffee")
    puts "Something went wrong: #{e.message}"
  else
    raise ArgumentError.new("You DID not feed me coffee!")
    # raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit :)"
  maybe_fruit = gets.chomp
  
  reaction(maybe_fruit) 
  feed_me_a_fruit if maybe_fruit == "coffee"
  
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    
    if name.length <= 5 || fav_pastime.length <= 5
      raise ArgumentError.new("Name and fav past time less than 5")
      
    end
  end
  
  def yrs_known
    @yrs_known
  end
  #   else 
  #     raise ArgumentError.new("I have not know you that long!")
  #   end 
  # end 
  def talk_about_friendship
    if @yrs_known >= 5
      puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
    else
      raise ArgumentError.new("I have not know you that long!")
    end
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


