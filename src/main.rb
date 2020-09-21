require 'set'
require_relative 'Card'
require_relative 'Game'

# Constants
TITLE  = "Kudu Rubyset"
WIDTH  = 700
HEIGHT = 500
MARGIN = 10
FPS    = 60
CARD_WIDTH = 120
CARD_HEIGHT = 80
CARD_PAD = 2

Shoes.app :width => WIDTH, :height => HEIGHT, :title => TITLE, :resizable => false do
  # Globals
  @game = Game.new
  @scale_animate = 1
  @hovered_card = -1

  # layout for cards
  def card_layout(index)
    s = stack width: CARD_WIDTH + CARD_PAD * 2, height: CARD_HEIGHT + CARD_PAD * 2 do
      # hover events
      hover do
        @hovered_card = index
      end
      leave do
        if @hovered_card == index
          @hovered_card = -1
        end
      end
    end
    # When card is clicked, select/deselect it
    s.click do
      @game.toggle_select_card(index)
    end
    @card_stacks.push(s)
  end

  # Game layout
  def game_layout()
    clear
    flow :width => WIDTH, :margin => MARGIN do
      stack :width => "100%" do
        title "Team Kudu\'s Game of Set!"
        @score_text = para
      end
      stack :width => "22.5%" do
        @new_game_btn = button "Start New Game"
        @new_game_btn.click do
          @game = Game.new
        end
      end
      @card_stacks = []
      stack :width => "55%" do
        for row in (0...4)
          flow do
            for col in (0...3)
              card_layout(row * 3 + col)
            end
          end
        end
      end
      stack :width => "22.5%" do
        para "High scores:"
      end
    end
  end

  # Initiate layout
  game_layout()

  # Update Loop
  def update
    # update time and score display
    @score_text.replace "Time: #{ @game.timer_text } Score: #{ @game.score }"

    # animate scale down when user has pair
    if @scale_animate < 0.05
      @scale_animate = 1
      @game.submit_selection
    elsif @game.has_pair
      @scale_animate *= 0.8
    else
      @scale_animate = 1
    end

    # update content of card stacks
    @card_stacks.each_with_index do |stack, index|
      stack.clear {
        cardleft = 0
        scale = 1

        # if card is selected
        if @game.is_card_selected? index
          # shake card if it is not a pair
          if @game.has_no_pair
            cardleft = Math.sin(Time.now.to_f * 12) * 6
          end
          
          # change background color to green if they are a pair
          if @game.has_pair
            background green

            # also scale animate
            scale = @scale_animate
          else
            background red
          end
        # if card is hovered over
        elsif index == @hovered_card
          background blue
        end

        # finally draw image
        image @game.deck[index].png_path,
              left:   (CARD_PAD + CARD_WIDTH * (1 - scale) / 2 + cardleft).to_i,
              top:    (CARD_PAD + CARD_HEIGHT * (1 - scale) / 2).to_i,
              width:  (CARD_WIDTH * scale).to_i,
              height: (CARD_HEIGHT * scale).to_i
      }
    end
  end

  #@shape = star(points: 5)
  #motion do |left, top|
  #  @shape.move left, top
  #end

  # Run game loop
  update()
  animate(FPS) do |frame|
    update()
  end
end
