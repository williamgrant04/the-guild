class GameMembersController < ApplicationController
  before_action :set_data, only: %i[new create]

  def new
    @game_member = GameMember.new
  end

  def create
    @game_member = GameMember.new(game_member_params)
    @game_member.game = Game.find(params[:game_id])
    # sets the member to the member with the username that was passed in the form
    @game_member.member = Member.find_by(username: params[:game_member][:member])
    if @game_member.save
      redirect_to @game
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_member_params
    params.require(:game_member).permit(:details, :member_game_name)
  end

  def set_data
    @game = Game.find(params[:game_id])
    # gets all the usernames of the members to display in the form
    @member_usernames = []
    Member.all.each { |member| @member_usernames << member.username }
  end
end
