class MembersController < ApplicationController

  def edit
    @member = Member.find(params[:id])
    authorize @member
  end

  def update
    @member = Member.find(params[:id])
    authorize @member
    @member.update(member_params)
    if @member.save
      flash[:success] = 'member updated!'
      redirect_to guild_path(@member.guild)
    else
      render action: :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:username, :profile_image)
  end

  # def set_guild
  #   @guild = Guild.find(params[:guild_id])
  # end
end
