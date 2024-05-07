class ModalsController < ApplicationController
  def test
    render partial: "modals/test"
  end

  def eat
    render partial: "modals/eat"
  end
end
