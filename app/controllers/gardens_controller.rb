class GardensController < ApplicationController
  before_action :set_garden, only: [ :show, :destroy ]
  # skip_before_action :authenticate_user!, only: [ :show, :new, :create, :destroy ]

  def index
    @garden = Garden.new
    @gardens = current_user.gardens
    @garden_count = @gardens.count
    @my_plants_count = my_plants_count
    @count = 0
    # @to_do_count = count_to_dos
  end

  def show
    @my_plants = @garden.my_plants
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @garden.destroy
  end

  private

  # def count_to_dos
  #   @gardens = Garden.where(user: current_user)
  #   @my_plants = @garden.my_plants
  #   i = 0
  #   count = 0
  #   @my_plants.each do |plant|
  #     if plant.water?
  #       count += 1
  #     else
  #       next
  #     end
  #   end
  #   return count
  # end

  def my_plants_count
    @gardens = current_user.gardens
    # @gardens.map { |garden| garden.my_plants.count }.sum
    plant_count = 0
    @gardens.each do |garden|
      plant_count += garden.my_plants.count
    end
    return plant_count
  end

  def garden_params
    params.require(:garden).permit(:name)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
