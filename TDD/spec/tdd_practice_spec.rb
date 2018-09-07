require 'RSpec'
require 'tdd_practice'
# RSpec.describe Methods do 
  describe 'my_uniq method' do 
    arr = [1,2,1,3,3]
    # arr = 
    # it 'Removes duplicates one duplicates in an Array' do 
    # 
    # end
    
    it 'Removes multiple duplicates of Array' do 
      expect(my_uniq(arr)).to match_array([1,2,3])
    end 
    
    it 'Input array has same sequence as result' do 
      arr = [3,5,2,2,1]
      expect(my_uniq(arr)).to match([3,5,2,1])
    end 
  end 
  
  describe 'two_sum method' do
    arr = [-2, 3, 4, 2, 3, 1]
    answer = two_sum(arr) #[[0,3]]
    
    it 'Returns an array of pairs' do
      expect(answer.first.length).to eq(2) 
    end
    
    it 'Indexes of pairs return 0' do
      num1 = answer.first[0] 
      num2 = answer.first[1]
      expect(arr[num1] + arr[num2]).to eq(0)
    end
    
    it 'Returns indexes that appear first' do
      arr = [3,5,-2,-3,2,1]
      expect(two_sum(arr)).to match_array([[0,3],[2,4]])
    end 

    it 'Returns empty array if no matches' do 
      arr = [1,2,3,4,5,5]
      expect(two_sum(arr)).to be_empty
        end 
        
    it 'Array has 0 in the array' do
      arr = [1,2,3,4,0,0]
      expect(two_sum(arr)).to match_array([[4,5]])
    end
  end
  
  describe 'my_transpose method' do
    it 'Transpose original matrix'
    
    
    
    
    
  end