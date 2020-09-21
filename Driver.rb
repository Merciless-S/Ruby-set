require_relative "Utility"
#require_relative "Computer"

puts "Welcome to the game"
arr = Utility.generate_all_cards()
cards = Utility.generateCard!(arr)
score, bingo, trial = 0, 0, 0
got_hint = false
while Utility.check_if_contains_set(cards).size() == 0
  for i in 0...12
    arr.push(cards[i])
  end
  cards = Utility.generateCard!(arr)
end
#Thread.new { Computer.EasyDifficulty(cards) }
#set = Utility.check_if_contains_set(cards)
while arr.size() > 0
  set = Utility.check_if_contains_set(cards)
  Utility.print_cards(cards)
  #for i in 0...12
  #puts "index: #{i + 1}, shading: #{cards[i].style}, color: #{cards[i].color}, shape: #{cards[i].shape}, count: #{cards[i].count}"
  #end
  puts "Do u wanna get a hint? (y/n)"
  decision = gets.chomp
  if decision.eql?('y')
    got_hint = true
    puts "the set is #{set[0] + 1}, #{set[1] + 1}, #{set[2] +  1}"
  elsif decision.eql?('n')
    puts "OK"
  else
    puts "I don't understand what you are talking about"
  end
  puts "Please enter three card number one to a line:"
  a = gets.chomp.to_i - 1
  b = gets.chomp.to_i - 1
  c = gets.chomp.to_i - 1
  trial += 1
  if a < 0 or a > 12 or b < 0 or b > 12 or c < 0 or c > 12
    print("invalid number\n")
  elsif Utility.check_is_set?(cards[a], cards[b], cards[c])
    puts "Correct"
    cards[a], cards[b], cards[c] = arr.shift, arr.shift, arr.shift
    while Utility.check_if_contains_set(cards).size() == 0
      arr.push(cards[a])
      arr.push(cards[b])
      arr.push(cards[c])
      cards[a], cards[b], cards[c] = arr.shift, arr.shift, arr.shift
      arr.shuffle!
    end
    #puts "new cards generated"
    if got_hint == false
      score += 3
      bingo += 1
    else
      trial -= 1
      print("Since you got a hint, your accuracy and score would not change")
    end
  else
    puts "This is not a set. score -1"
    score -= 1
  end
  stats = 100.0 * bingo / trial

  got_hint = false
  print("\nyour average accuracy is #{stats}%, and your current score is #{score}\n")
  sleep(3)
end

print("Thanks for playing!")
