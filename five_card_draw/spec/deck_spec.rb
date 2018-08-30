require 'rspec'
require 'deck'

RSpec.describe Deck do 
  subject (:deck) {Deck.new}
  let(:card) {double "card"}
  
  
  
  describe "self.make_deck" 
    new_deck = Deck.make_deck
    it 'makes 52 cards' do 
      expect(new_deck.length).to eq(52)
    end 
    
    it 'contains card object' do 
      expect(new_deck[0].class).to be(Card) 
    end 
  
  describe '#initialize' do 
    it 'it creates an instance of a deck' do
      expect(deck.deck).to be_a(Array)
      expect(deck.deck.length).to eq(52)
    end
    
  end 
  
end 