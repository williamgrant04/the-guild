class GamesController < ApplicationController
  before_action :set_game

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.guild = Guild.find(params[:guild_id])

    if @game.save
      redirect_to guild_path(params[:guild_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @guild = Guild.find(params[:guild_id])
  end

  def game_params
    params.require(:game).permit(:name, :game_banner, :game_icon)
  end

end
