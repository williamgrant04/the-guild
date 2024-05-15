class GuildsController < ApplicationController
  def show
    @guild = Guild.find(params[:id])
    @games = @guild.games
    @members = @guild.members
    authorize @guild
  end

  def new
    @guild = Guild.new
    authorize @guild
  end

  def create
    @guild = Guild.new(guild_params)
    authorize @guild
    @guild.owner = current_user.member

    if @guild.save
      redirect_to guild_path(@guild)
    else
      redirect_back fallback_location: root_path, alert: 'Guild could not be created'
    end
  end

  def edit
    @member = current_user
    @guild = Guild.find(params[:id])
    authorize @guild
  end

  def update
    @member = current_user
    @guild = Guild.find(params[:id])
    authorize @guild
    if @guild.update(guild_params)
      flash[:success] = 'Guild updated!'
      redirect_to guild_path(@guild)
    else
      render action: :edit
    end
  end

  def invite
    # I dont think this needs authorization, but we'll find out later I suppose

    # If the user isn't signed in, or doesn't have an account
    if !user_signed_in?
      redirect_to new_user_session_path
    end

    @guild = Guild.find_by(join_code: params[:join_code])
    authorize @guild
    @member = current_user.member
    @member.guild = @guild
    if @member.save
      redirect_to guild_path(@guild)
    else
      redirect_to root_path
    end
  end

  private

  def guild_params
    params.require(:guild).permit(:name, :image, :icon)
  end
end
