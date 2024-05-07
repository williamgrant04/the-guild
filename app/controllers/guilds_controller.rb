class GuildsController < ApplicationController
  def show
    @guild = Guild.find(params[:id])
  end
end
