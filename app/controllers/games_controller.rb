class GamesController < ApplicationController
  before_action :set_guild

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.guild = @guild

    if @game.save
      redirect_to guild_path @guild
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def game_params
    params.require(:game).permit(:name, :game_banner, :game_icon)
  end

end
