class GuildsController < ApplicationController
  def show
    @guild = Guild.find(params[:id])
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
      render :new, status: :unprocessable_entity
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
    @guild = Guild.find_by(join_code: params[:join_code])
    @member = current_user.member
    # @member.guild = @guild
    # if @member.save
    #   redirect_to guild_path(@guild)
    # else
    #   root_path()
    # end
  end

  private

  def guild_params
    params.require(:guild).permit(:name, :image, :icon)
  end
end
