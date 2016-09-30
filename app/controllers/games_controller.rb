class GamesController < ApplicationController
  before_action :get_game, :only=> [:show, :edit, :update, :destroy]
  def index
    @games = Game.page(params[:page]).per(5)
    if params[:id]
      @game = Game.find(params[:id])
    else
      @game = Game.new
    end
  end

  def show
    @page_title = @game.name
  end

  # def new
  #   @game = Game.new
  # end

  def create
    @game = Game.new(game_params)
    @games = Game.page(params[:page]).per(5)
    if @game.save
      flash[:notice] = "Yay!Time to play!"
      redirect_to games_path
    else
      flash[:alert] = "Duh"
      render :action => :index
    end
  end

  # def edit
  # end

  def update
    @games = Game.page(params[:page]).per(5)
    if @game.update(game_params)
      flash[:notice] = "Game info updated!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Duhhhh!"
      render "index"
    end
  end

  def destroy
    @game.destroy
    flash[:alert] = "Game DELETED;("
    redirect_to games_path(:page => params[:page])
  end




  private
  def get_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :platform, :last_play_time, :release_day, :category_id, :platform_ids => [] )
  end





end
