class ModalsController < ApplicationController
  skip_after_action :verify_authorized
  def get_modal
    render partial: "modals/#{params[:modal]}"
  end
end
