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
      redirect_back(fallback_location: root_path, notice: 'Guild member updated successfully')
    else
      redirect_back(fallback_location: root_path, alert: 'Guild member could not be updated')
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
