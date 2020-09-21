#This is a Utility class that contains useful method for Driver.rb
require 'colorize'
require 'set'
require_relative "Card"
module Utility
  #Check if a array of card object contains at least one set
  def Utility.check_if_contains_set(cards)
    for i in 0...cards.length - 2
      for j in i + 1...cards.length - 1
        for k in j + 1...cards.length
          if Utility.check_is_set?(cards[i], cards[j], cards[k])
            return [i, j, k]
          end
        end
      end
    end
    return []
  end

  #Generate all possible combination of cards and return an array
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

  #Randomly sample 12 cards from the array of cards
  def Utility.generateCard!(arr)
    cards = Array.new(12)
    for i in 0...12
      cards[i] = arr.sample
      arr.delete(cards[i])
    end
    return cards
  end

  #Check if three cards are a set
  def Utility.check_is_set?(a, b, c)
    unique_color = [a.color, b.color, c.color].to_set.size()
    unique_shape = [a.shape, b.shape, c.shape].to_set.size()
    unique_count = [a.count, b.count, c.count].to_set.size()
    unique_shading = [a.style, b.style, c.style].to_set.size()
    if (unique_shading == 3 or unique_shading == 1) and (unique_color == 3 or unique_color == 1) and (unique_shape == 3 or unique_shape == 1) and (unique_count == 3 or unique_count == 1)
      return true
    end
    return false
  end

  #display the card object in terminal with style, shape, color and count
  def Utility.print_cards(cards)
    for i in 0...3
      print((i * 4 + 1).to_s.rjust(2, "0") + " " + "*" * 11 + " " + (i * 4 + 2).to_s.rjust(2, "0") + " " + "*" * 11 + " ")
      print((i * 4 + 3).to_s.rjust(2, "0") + " " + "*" * 11 + " " + (i * 4 + 4).to_s.rjust(2, "0") + " " + "*" * 11 + "\n")
      print("   *" + " " * 9 + "*    *" + " " * 9 + "*    *" + " " * 9 + "*    *" + " " * 9 + "*\n")
      Utility.print_three(cards[4 * i], cards[4 * i + 1], cards[4 * i + 2], cards[4 * i + 3], false)
      Utility.print_three(cards[4 * i], cards[4 * i + 1], cards[4 * i + 2], cards[4 * i + 3], true)
      Utility.print_three(cards[4 * i], cards[4 * i + 1], cards[4 * i + 2], cards[4 * i + 3], false)
      #print("   *" + " " * 9 + "*    *" + " " * 9 + "*    *" + " " * 9 + "*    *" + " " * 9 + "*\n")
      print("   " + "*" * 11 + "    " + "*" * 11 + "    " + "*" * 11 + "    " + "*" * 11 + "\n")
      print("\n")
    end
  end

  #print four shape in four cards. A helper method of Utility.print_cards(cards)
  def Utility.print_three(a, b, c, d, is_second)
    Utility.print_line(a, b, c, d, is_second, false)
    Utility.print_line(a, b, c, d, is_second, true)
    print("   *" + " " * 9 + "*    *" + " " * 9 + "*    *" + " " * 9 + "*    *" + " " * 9 + "*\n")
    #Utility.print_line(a,b,c,d,is_second, false)
  end

  #A helper method of Utility.print_cards(cards)
  def Utility.print_line(a, b, c, d, is_second, is_mid)
    print("   *  ")
    Utility.print_each(a, is_mid, is_second)
    print("  *    *  ")
    Utility.print_each(b, is_mid, is_second)
    print("  *    *  ")
    Utility.print_each(c, is_mid, is_second)
    print("  *    *  ")
    Utility.print_each(d, is_mid, is_second)
    print("  *\n")
  end

  #A helper method of Utility.print_cards(cards)
  def Utility.print_each(card, is_mid, is_second)
    if (card.count == 1 and not is_second) or (card.count == 2 and is_second)
      print(" " * 5)
    else
      if is_mid
        Utility.print_mid(card)
      else
        Utility.print_side(card)
      end
    end
  end

  #A helper method of Utility.print_cards(cards)
  def Utility.print_side(card)
    char = Utility.char_style(card)
      if card.shape == 1
        print(" " * 5)
      elsif card.shape == 0
          print(char * 2 + " " + char * 2)
      else
        print("  " + char + "  ")
      end
  end

  #A helper method of Utility.print_cards(cards)
  def Utility.print_mid(card)
    char = Utility.char_style(card)
    if card.shape != 1
      print(" " + char * 3 + " ")
    else
      print(char * 5)
    end
  end

  #Decide what kind of char should the card use. A helper method of Utility.print_cards(cards)
  def Utility.char_style(card)
    if card.style == 0
      char = "@"
    elsif card.style == 1
      char = "#"
    else
      char = "&"
    end
    if card.color == 0
        char = char.green
    elsif card.color == 1
        char = char.red
    else
        char = char.blue
    end

  end
end
