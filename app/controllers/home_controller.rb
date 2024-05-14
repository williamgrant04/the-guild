class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def home
    # render status: 500 <- This was used to force a 500 error for testing
    render "home/home", layout: false
  end
end
