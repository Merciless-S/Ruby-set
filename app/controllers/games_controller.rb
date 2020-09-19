require_relative "Card"

class GamesController < ApplicationController
  # Index page.
  def index
    @games = Game.all

    # Redirect user to create a new game if there are no games yet
    if @games.length == 0
      redirect_to action: 'new'
    end
  end

  # New game page
  def new
    # Create a new game
    @game = Game.new
  end

  # Post create action that creates a new game
  def create
    @game = Game.new

    # Set score and 
    @game.score = 0
    @game.cardsleft = 80

    @game.card1 = Card.new().tostring()
    @game.card2 = Card.new().tostring()
    @game.card3 = Card.new().tostring()
    @game.card4 = Card.new().tostring()
    @game.card5 = Card.new().tostring()
    @game.card6 = Card.new().tostring()
    @game.card7 = Card.new().tostring()
    @game.card8 = Card.new().tostring()
    @game.card9 = Card.new().tostring()
    @game.card10 = Card.new().tostring()
    @game.card11 = Card.new().tostring()
    @game.card12 = Card.new().tostring()

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  # Show a game
  helper GamesHelper
  def show
    @game = Game.find(params[:id])
  end

  private

  def post_params
    params.require(:game).permit(:score, :cardsleft, :card1, :card2, :card3, :card4, :card5, :card6, :card7, :card8, :card9, :card10, :card11, :card12,)
  end

end
