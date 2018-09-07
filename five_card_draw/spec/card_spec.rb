require 'card'
require 'rspec'

RSpec.describe Card do 
  subject(:card) {Card.new("3".to_sym, "spade".to_sym)}
  describe '#initialize' do 
    it 'takes value' do 
      expect(card.value).to eq("3".to_sym)
    end
    
    it 'takes suites' do 
      expect(card.suite).to eq(:spade)
    end
    
    it 'values range from 2-10 or J, Q, K ,A' do
      values = ("2".."10").to_a + ["J","Q","K","A"]
      expect(card.value).to eq("3".to_sym) #ask ta how useful this method how to do it better?
    end 
    
    it 'suites have symbols of spade, heart, club, diamond' do 
      symbols = ["spade", "heart", "club", "diamond"]
      expect(card.suite).to eq(:spade)
    end 
  end 
  
  describe '#convert_num' do
    it 'return corresponding int value' do
      expect(card.convert_num).to eq([3,4])
    end
  
  end
    
    
      describe '#flip' do 
    it 'reveal values and symbols of hand to player/players'
  end 
end 