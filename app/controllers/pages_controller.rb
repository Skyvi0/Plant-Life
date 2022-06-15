class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @gardens = current_user.gardens
    @garden = Garden.new
    @my_plants = current_user.my_plants.order(:last_watered)
  end

  def landing
  end
end
