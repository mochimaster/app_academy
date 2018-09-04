class Card
  attr_reader :value, :suite
  def initialize(value,suite)
    @value = value
    @suite = suite
  end 
  
  def convert_num
    value_arr = ("2".."10").to_a + ["J","Q","K","A"]
    suite_arr = ["diamond","club","heart","spade"]
    
    value_arr.map! {|val| val.to_sym}
    suite_arr.map! {|sui| sui.to_sym}
    
    
    value_int = value_arr.index(self.value) + 2
    suite_int = suite_arr.index(self.suite) + 1
    
    [value_int,suite_int]
  end
  
  
  
  
end