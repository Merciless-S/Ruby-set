class Game
  def initialize
    @start = Time.now.to_i
    @time_since_last_pair = Time.now
    @score = 0
    @deck = Card.new_shuffled_deck
    @selected = []
    @has_pair = false
    @has_no_pair = false
  end

  attr_reader :score, :deck, :selected, :has_pair, :has_no_pair

  def timer_text
    Time.now.to_i - @start
  end

  def clicked_card(index)
    @selected.push(index)
  end

  def toggle_select_card(index)
    if @selected.include? index
      @selected.delete_if {|v| v == index }
    else
      @selected.push(index)
    end

    # did user select a pair of 3 valid cards or not
    @has_pair = (@selected.length == 3) && Card.cards_are_set?(@deck[@selected[0]], @deck[@selected[1]], @deck[@selected[2]])
    @has_no_pair = (@selected.length > 2) && (not @has_pair)
  end

  def is_card_selected?(index)
    @selected.include? index 
  end

  def submit_selection
    if @has_pair
      @has_pair = false
      @deck.delete_if {|i| is_card_selected? i }
      @selected = []

      # give user score depending on the time since they matched their last pair
      @score += (1000 / Math.log(Time.now - @time_since_last_pair)).to_i

      @time_since_last_pair = Time.now
    end
  end
end
