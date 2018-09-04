class Deck
  def self.make_deck
    value_arr = ("2".."10").to_a + ["J","Q","K","A"]
    suite_arr = ["diamond","club","heart","spade"]
    
    result = []
    
    suite_arr.each do |type| 
      value_arr.each do |num|
        result << Card.new(num.to_sym,type.to_sym)
      end
    end
    result
  end
  
  attr_reader :deck
  def initialize
    @deck = Deck.make_deck
    @deck.shuffle!
  
  end
  
end