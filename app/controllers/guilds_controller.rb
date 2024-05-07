class GuildsController < ApplicationController
  def show
    @guild = Guild.find(params[:id])
  end

  def new
    @guild = Guild.new
  end

  def create
    @guild = Guild.new(guild_params)
    if @guild.save
      redirect_to @guild.find(params[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @member = current_user
    @guild = Guild.find(params[:id])
  end

  def update
    @member = current_user
    @guild = Guild.find(params[:id])
    if @guild.update(guild_params)
      flash[:success] = 'Guild updated!'
      redirect_to guild_path(@guild)
    else
      render action: :edit
    end
  end

  def invite
    @member = current_user
    @guild = Guild.find(params[:id])
  end

  private

  def guild_params
    params.require(:guild).permit(:name, :image, :icon)
  end
end
