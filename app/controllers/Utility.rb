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

    def Utility.generate_all_cards()
        arr = Array.new(81)
        cur = 0
        for i in 0...3
            for j in 0...3
                for k in 0...3
                    for h in 0...3
                        arr[cur] = Card.new(i.to_s + j.to_s + k.to_s + (h + 1).to_s)
                        cur += 1
                    end
                end
            end
        end
        arr.shuffle!
        return arr
    end
   
    def Utility.generateCard!(arr)
        cards = Array.new(12)
        for i in 0...12
            cards[i] = arr.sample
	    arr.delete(cards[i])
        end
        return cards
    end

    def Utility.check_is_set?(a, b, c)
        unique_color = [a.color,b.color,c.color].to_set.size()
        unique_shape = [a.shape,b.shape,c.shape].to_set.size()
        unique_count = [a.count, b.count, c.count].to_set.size()
	unique_shading = [a.style, b.style, c.style].to_set.size()
        if (unique_shading == 3 or unique_shading == 1) and (unique_color == 3 or unique_color == 1) and (unique_shape == 3 or unique_shape == 1) and (unique_count == 3 or unique_count == 1)
            return true
        end
        return false
    end
end
