def my_uniq(arr)
  result = []
  
  arr.each {|num| result.include?(num) ? next : result << num }
  result
end

def two_sum(arr)
  result = []
  arr.each.with_index do |num1,idx1|
    arr.each.with_index do |num2, idx2|
      if idx1 < idx2 && num1 + num2 == 0
        result << [idx1, idx2]
      end 
    end 
  end 
  result
end 

