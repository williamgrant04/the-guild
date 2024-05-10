class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def home
    render "home/home", layout: false
  end
end
