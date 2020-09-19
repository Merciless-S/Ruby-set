class Card
    
  # Color means the color of the card. red = 0, green = 1, purple = 2
  # Shape means the shape of the card. pill = 0, swiggly = 1, diamond = 2
  # Style means the style of the card. filled = 0, outline = 1, striped = 2
  # Count is the number of shapes shown on the card.
  def initialize
    @color = rand(0..2)
    @shape = rand(0..2)
    @style = rand(0..2)
    @count = rand(1..3)
  end
      
  def color
    @color
  end
  
  def shape
    @shape
  end
  
  def style
    @style
  end

  def count
    @count
  end

  # 3 digits in order of: shape color style count
  def tostring
    @color.to_s + @shape.to_s + @style.to_s + @count.to_s
  end
end