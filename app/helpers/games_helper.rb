module GamesHelper
  # Classes for a card depending on its appearance
  def cardClasses(val)
    'color-' + val[0,1] + ' style-' + val[2,1]
  end

  def cardShapeIsPill(val)
    val[1,1] == '0'
  end

  def cardShapeIsSwiggly(val)
    val[1,1] == '1'
  end

  def cardShapeIsDiamond(val)
    val[1,1] == '2'
  end

  def cardCount(val)
    val[3,1].to_i
  end
end
