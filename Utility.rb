require 'set'
require_relative "Card"
module Utility
    def Utility.check_if_contains_set(cards)
            for i in 0...cards.length - 2
                for j in i + 1...cards.length - 1
                    for k in j + 1...cards.length
                        if Utility.check_is_set?(cards[i], cards[j], cards[k])
                            return [i,j,k]
                        end
                    end
                end
            end
        return []
    end

    
    def Utility.generateCard()
        cards = Array.new(12)
        for i in 0...12
            cards[i] = Card.new()
        end
        cards
    end

    def Utility.check_is_set?(a, b, c)
        unique_color = [a.color,b.color,c.color].to_set.size()
        unique_shape = [a.shape,b.shape,c.shape].to_set.size()
        unique_number = [a.number, b.number, c.number].to_set.size()
        if (unique_color == 3 or unique_color == 1) and (unique_shape == 3 or unique_shape == 1) and (unique_number == 3 or unique_number == 1)
            return true
        end
        return false
    end
end
