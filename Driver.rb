require_relative "Utility"
#require_relative "Computer"

puts "Welcome to the game"
arr = Utility.generate_all_cards()
cards = Utility.generateCard!(arr)
score = 0
while Utility.check_if_contains_set(cards).size() == 0
    for i in 0...12
    	arr.push(cards[i])
    end
    cards = Utility.generateCard!(arr)
end
#Thread.new { Computer.EasyDifficulty(cards) }
#set = Utility.check_if_contains_set(cards)
for i in 1...5
    set = Utility.check_if_contains_set(cards)
    for i in 0...12
        puts "index: #{i}, shading: #{cards[i].style}, color: #{cards[i].color}, #{cards[i].shape}, #{cards[i].count}"
    end
    puts "Do u wanna get a hint? (y/n)"
    decision = gets.chomp
    if decision.eql?('y')
        puts "the set is #{set[0]}, #{set[1]}, #{set[2]}"
    end
    puts "Enter your card number:"
    a = gets.chomp.to_i
    b = gets.chomp.to_i
    c = gets.chomp.to_i
    if Utility.check_is_set?(cards[a],cards[b], cards[c])
        puts "Correct"
        cards[a], cards[b], cards[c] = arr.shift, arr.shift, arr.shift
        while Utility.check_if_contains_set(cards).size() == 0
	        arr.push(cards[a])
	        arr.push(cards[b])
            arr.push(cards[c])
            cards[a], cards[b], cards[c] = arr.shift, arr.shift, arr.shift
    		arr.shuffle!
        end
	puts "new cards generated"
        score += 1
    else
        puts "This is not a set"
    end
end
        
puts Utility.check_if_contains_set(cards)
