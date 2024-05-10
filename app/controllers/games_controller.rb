class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  before_action :set_guild, only: %i[new create]

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.guild = @guild

    if @game.save
      redirect_to guild_path @guild, notice: 'Game was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /games/:id/edit
  def edit
  end

  # PATCH/PUT /games/:id
  def update
    if @game.update(game_params)
      redirect_to game_path(@game), notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # GET /games/:id
  def show
    @game = Game.find(params[:id])
    @game_members = @game.game_members
    authorize @game
  end

  # DELETE /games/:id
  def destroy
    @game.destroy
    redirect_to games_path, notice: 'Game was successfully destroyed.'
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
