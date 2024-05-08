class ModalsController < ApplicationController
  # In this controller when you want to add a modal, you need to create
  # a new method for that modal. For example, if you want to add a modal
  # called "games", you need to create a new method called "games" and
  # render that partial just like below.
  # You also need to add a route in config/routes.rb for that method.

  # def test
  #   render partial: "modals/test"
  # end

  def get_modal
    render partial: "modals/#{params[:modal]}"
  end
end
