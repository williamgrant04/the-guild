class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  before_action :set_guild, only: %i[new create]

  def new
    @games = Game.where(guild: @guild)
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.guild = @guild

    if @game.save
      redirect_back(fallback_location: root_path, notice: 'Game added successfully')
    else
      redirect_back(fallback_location: root_path, alert: 'Game could not be added')
    end
    authorize @game
  end

  # GET /games/:id/edit
  def edit
    authorize @game
  end

  # PATCH/PUT /games/:id
  def update
    if @game.update(game_params)
      redirect_back(fallback_location: root_path, notice: 'Game updated successfully')
    else
      redirect_back(fallback_location: root_path, alert: 'Game could not be updated')
    end
    authorize @game
  end

  # GET /games/:id
  def show
    @game = Game.find(params[:id])
    @game_members = @game.game_members
    authorize @game
  end

  # DELETE /games/:id
  def destroy
    @guild = @game.guild
    @game.destroy
    redirect_to guild_path(@guild), notice: 'Game was successfully deleted.'
    authorize @game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def game_params
    params.require(:game).permit(:name, :game_banner, :game_icon)
  end

end
