class Card

  # Color means the color of the card. green = 0, red = 1, blue = 2
  # Shape means the shape of the card. heart = 0, line = 1, triangle = 2
  # Style means the style of the card. @ = 0, # = 1, & = 2
  # Count is the number of shapes shown on the card.
  def initialize(s)
    @color = s[0].to_i
    @shape = s[1].to_i
    @style = s[2].to_i
    @count = s[3].to_i
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
  def to_s
    @color.to_s + @shape.to_s + @style.to_s + @count.to_s
  end
end
