
  def my_min_1(list)
    smallest = list.first

    list.each_with_index do |num1, idx1|
      list.each_with_index do |num2, idx2|
        if num1 < num2 && num1 < smallest
          smallest = num1
        end
      end
    end
    smallest
  end

  def my_min_2(list)
    smallest = list.first

    list.each do |num|
      num < smallest ? smallest = num : next
    end
    smallest
  end

  def largest_contiguous_subsum(list) # => Find out about time complexity
    # largest = list.first

    sub_arr = []

    #n^2
    # n
    list.each_index do |i|
      # n
      (i...list.length).each do |i2|
        # sum = list[i..i2].reduce(:+)
        # largest = sum if sum > largest
        sub_arr << list[i..i2]
      end
    end

    # n^3
    # n^2
    result = sub_arr.map do |el|
      #[1, 2, 3, 4, 5]
      # n
      el.reduce(:+)
    end

    result.max # n^2
  end

  def largest_contiguous_subsum_2(list)
    curr_sum = 0
    max_sum = 0

    list.each do |el|
      curr_sum += el

      if curr_sum < 0
        curr_sum = 0
      end

      if curr_sum > max_sum
        max_sum = curr_sum
      end
      p [el, curr_sum, max_sum]
    end
    max_sum
  end

  def rec_sum(arr)
    return 0 if arr.empty?

    arr[0] + rec_sum(arr[1..-1])
  end

                #n
  def anagram?(str1,str2)
    chars = str1.chars   #n
          # +
    perms = chars.permutation.to_a #n!
          #+
    perms.each do |perm| #n!

                        #n      #1
      return true if perm.join == str2

    end   #=> n! * n

    false
  end  #=> n +n! + (n!*n)  ....... O(n!*n)


  def second_anagram(str1, str2)
    str1_chars = str1.chars #n
    #+
    str2_chars = str2.chars #n
#+
    str1_chars.each do |char| #n
      #*
      idx = str2_chars.find_index(char) #n
      #+
      return false if idx == nil #constant
      #+
      str2_chars.delete_at(idx) #n

    end #n(n+1+n) => 2n^2 + n



    str2_chars.empty? ? true : false

  end #==> O(n^2)

  def third_anagram?(str1,str2)
    str1_s = str1.split("").sort #=> n^2
                                  #=> +
    str2_s = str2.split("").sort #=> n^2


    str1_s == str2_s ? true : false
  end #=> O(n^2)

  def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}

    return true if hash1 == hash2
    false
  end #==> O(n)

  def fourth_anagram2?(str1, str2)
    hash = Hash.new(0)

    str1.each_char {|char| hash[char] += 1}
    str2.each_char {|char| hash[char] -= 1}

    return true if hash.select {|k,v| v!=0 }.empty?
    false
  end #==> O(n)

  def bad_two_sum(arr, target)
    sums = []

    arr.each do |num1|
      arr.each do |num2|
        sums << num1+num2
      end
    end

    sums.include?(target) ? true : false
  end #==> O(n^2)

  def sort(arr, target)
    arr.sort! #nlogn
    arr2 = arr.dup #n

    i = 0
    while i < arr.length #n

      if arr2[0] + arr2[-1] == target
        return true
      elsif arr2[0] + arr2[-1] < target
          arr2.shift
      elsif arr2[0] + arr2[-1] > target
          arr2.pop
      end
      i += 1
    end
    false
  end

  def b_search(arr, target)
    mid = arr.length / 2

    if arr[mid] == target
      return mid
