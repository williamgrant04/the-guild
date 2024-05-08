class ModalsController < ApplicationController
  def get_modal
    render partial: "modals/#{params[:modal]}"
  end
end
