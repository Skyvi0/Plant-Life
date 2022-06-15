class MyPlantsController < ApplicationController
  before_action :set_garden, only: [ :new, :create, :show]
  before_action :set_my_plant, only: [ :show, :water ]
  skip_before_action :authenticate_user!, only: [ :new, :create, :show ]

  def new
    @my_plant = MyPlant.new
  end

  def edit
    @my_plant = MyPlant.find(params[:id])
    @garden = Garden.find(params[:garden_id])
  end

  def update
    @my_plant = MyPlant.find(params[:id])
    @my_plant.update(my_plant_params)
    @garden = Garden.find(params[:garden_id])
    redirect_to garden_path(@garden)
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @my_plant = MyPlant.new(my_plant_params)
    @garden = Garden.find(params[:garden_id])
    @my_plant.garden = @garden
    @my_plant.plant = Plant.find(params[:plant_id])
    if @my_plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def index
    # display plants the user searched for
    @garden = Garden.find(params[:garden_id])
    @my_plants = @garden.my_plants
  end

  def show
    # set_my_plant
    # @my_plants_count = my_plants_count
    @count = 0
  end

  def water
    # set_my_plant
    @my_plant.update(last_watered: Date.today)
    # redirect_to :root
  end

  # service: https://my-api.plantnet.org/v2/identify/all
  # api-key: api-key=2b10u4CCI6D9vcBSt3qJ63MO
  # image_1: images=https%3A%2F%2Fmy.plantnet.org%2Fimages%2Fimage_1.jpeg
  # image_2: images=https%3A%2F%2Fmy.plantnet.org%2Fimages%2Fimage_2.jpeg
  # organ_1: organs=flower
  # organ_2: organs=leaf

  def fetch_api
    garden = Garden.find(params[:garden_id])
    my_plant = MyPlant.create(garden: garden)
    my_plant.photo.attach(params[:photo])
    base_url = "https://my-api.plantnet.org/v2/identify/all"
    api_key = ENV["IMG_API"]
    img_url = my_plant.photo.url
    organ = "auto"
    full_url = "#{base_url}?api-key=#{api_key}&images=#{img_url}&organs=#{organ}"
    puts full_url
    response = RestClient.get(full_url)
    puts response
    response = JSON.parse(response)
    result_family = response['results'].first['species']['family']['scientificNameWithoutAuthor']
    result_genus =  response['results'].first['species']['genus']['scientificNameWithoutAuthor']
    plant = Plant.where("family ILIKE ? AND latin ILIKE ?", "#{result_family}", "%#{result_genus}%").first
    if plant.nil?
      my_plant.destroy
      redirect_to garden_my_plants_path(garden)
      flash[:alert] = "Oops, something went wrong. Please try again."
    else
      my_plant.plant = plant
      my_plant.nickname = "#{current_user.first_name}'s #{plant.latin}"
      my_plant.last_watered = Date.today
      my_plant.save
      redirect_to edit_garden_my_plant_path(garden, my_plant)
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_my_plant
    @my_plant = MyPlant.find(params[:id])
  end

  def my_plant_params
    params.require(:my_plant).permit(:nickname, :light_exposure, :photo, :last_watered, :plant_id)
  end
end
