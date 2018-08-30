require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
begin
  sam = BestFriend.new('', 1, '')
rescue
  puts "Please input at least 5 characters for first and third argument!"
end 
sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
