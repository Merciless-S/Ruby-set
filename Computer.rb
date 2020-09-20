require 'set'
require_relative "Card"
compScore = 0
module Computer
    def Computer.EasyDifficulty(cards)
        while(1)
            sleep(5)
            set = Utility.check_if_contains_set(cards)
            cards[set[0]], cards[set[2]], cards[set[2]] = Card.new, Card.new, Card.new
            compScore = 1
            puts "Computer Scored!"
            for i in 0...12
                 puts "index: #{i}, shading: #{cards[i].shading}, color: #{cards[i].color}, #{cards[i].shape}, #{cards[i].number}"
            end
        end
    end
end
