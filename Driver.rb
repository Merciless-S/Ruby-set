require_relative "Utility"

puts "Welcome to the game"
cards = Utility.generateCard()
score = 0
while Utility.check_if_contains_set(cards).size() == 0
    cards = Utility.generateCard()
end
#set = Utility.check_if_contains_set(cards)
for i in 1...5
    set = Utility.check_if_contains_set(cards)
    for i in 0...12
        puts "index: #{i}, shading: #{cards[i].shading}, color: #{cards[i].color}, #{cards[i].shape}, #{cards[i].number}"
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
        cards[a], cards[b], cards[c] = Card.new, Card.new, Card.new
        while Utility.check_if_contains_set(cards).size() == 0
            cards[a], cards[b], cards[c] = Card.new, Card.new, Card.new
        end
	puts "new cards generated"
        score += 1
    else
        puts "This is not a set"
    end
end
        
puts Utility.check_if_contains_set(cards)

