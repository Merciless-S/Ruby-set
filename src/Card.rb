require 'set'

# Color means the color of the card. red = 0, green = 1, purple = 2
# Shape means the shape of the card. pill = 0, swiggly = 1, diamond = 2
# Style means the style of the card. filled = 0, outline = 1, striped = 2
# Count is the number of shapes shown on the card.
class Card
  def initialize(color, shape, style, count)
    @color = color
    @shape = shape
    @style = style
    @count = count
  end
      
  attr_reader :color, :shape, :style, :count

  # 3 digits in order of: shape color style count
  def to_s
    @color.to_s + @shape.to_s + @style.to_s + @count.to_s
  end

  # Return relative filepath for a png that represents this shape
  def png_path
    "../images/#{ self.to_s }.png"
  end

  # Generates a shuffle array of all 81 possible cards
  def Card.new_shuffled_deck()
    arr = []
    for color in 0...3
      for shape in 0...3
        for style in 0...3
          for count in 1...4
            arr.push(Card.new(color, shape, style, count))
          end
        end
      end
    end
    arr.shuffle!
    return arr
  end

  # Are 3 cards a valid set?
  def Card.cards_are_set?(a, b, c)
    colors = [a.color, b.color, c.color].to_set.length()
    shapes = [a.shape, b.shape, c.shape].to_set.length()
    counts = [a.count, b.count, c.count].to_set.length()
    shades = [a.style, b.style, c.style].to_set.length()
    matches = [colors, shapes, counts, shades]
    if matches.sort == [1, 3, 3, 3] # all cards are different except for one similar feature
      return true
    else
      return false
    end
  end
end
