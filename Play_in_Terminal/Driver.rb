#This is a program that allows user to play card set game in their Linux Terminal
require_relative "Utility"

puts "Welcome to the game"
#Generate an array that contains all possible of combination
arr = Utility.generate_all_cards()


#User score, number of correct trials, total number of trials
score, bingo, trial = 0, 0, 0
#if user got a hint or not
got_hint = false
#Generate 12 cards from arr, and push it on the desk
cards = Utility.generateCard!(arr)
#Make sure there is at least one set
while Utility.check_if_contains_set(cards).size() == 0
  for i in 0...12
    arr.push(cards[i])
  end
  cards = Utility.generateCard!(arr)
end
#Keep running the game until no cards in the arr
while arr.size() > 0
  #set Timer
  time = Time.now
  set = Utility.check_if_contains_set(cards)
  #print cards for user
  Utility.print_cards(cards)
  #Check if user want a hint
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
    #case where user choice is correct
    puts "Correct"
    cards[a], cards[b], cards[c] = arr.shift, arr.shift, arr.shift
    #generate new cards
    while Utility.check_if_contains_set(cards).size() == 0
      arr.push(cards[a])
      arr.push(cards[b])
      arr.push(cards[c])
      cards[a], cards[b], cards[c] = arr.shift, arr.shift, arr.shift
      arr.shuffle!
    end
    if got_hint == false
      score += 3
      bingo += 1
    else
      trial -= 1
      print("Since you got a hint, your accuracy and score would not change\n")
    end
  else
    #case where user choice is wrong
    puts "This is not a set. score -1"
    score -= 1
  end
  stats = 100.0 * bingo / trial
  if trial == 0
    stats = 0
  end
  got_hint = false
  #display info
  print("you used #{Time.now - time} seconds for this trial\n")
  print("your average accuracy is #{stats}%, and your current score is #{score}\n\n")
  sleep(4)
end

print("Thanks for playing!")
