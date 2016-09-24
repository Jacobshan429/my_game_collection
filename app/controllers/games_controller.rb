class GamesController < ApplicationController
  before_action :get_game, :only=> [:show, :edit, :update, :destroy]
  def index
    @games = Game.page(params[:page]).per(5)
  end

  def show
    @page_title = @game.name
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "Yay!Time to play!"
      redirect_to games_path
    else
      flash[:alert] = "Duh"
      render new_game_path
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      flash[:notice] = "Game info updated!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Duhhhh!"
      render "edit" # :action=> :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end




  private
  def get_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :platform)
  end





end
