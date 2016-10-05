class GamePlayersController < ApplicationController
  before_action :get_game
  def index
    @players = @game.players
  end

  def show
    @player = @game.players.find(params[:id])
  end

  def new
    @player = @game.players.build
  end

  def create
    @player = @game.players.build(params_player)
    if @player.save
      redirect_to game_players_path(@game)
    else
      render "new"
    end
  end

  def edit
    @player = @game.players.find(params[:id])
  end

  def update
    @player = @game.players.find(params[:edit_comment])
    if @player.update(params_player)
      redirect_to game_players_path(@game)
    else
      render "edit"
    end

  end


  def destroy
    @player = @game.players.find(params[:id])
    @player.destroy
    redirect_to game_players_path(@game)
  end

  private

  def get_game
    @game = Game.find( params[:game_id] )
  end

  def params_player
    params.require(:player).permit(:name)
  end

end
