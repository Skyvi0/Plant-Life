require 'open-uri'
require 'nokogiri'
require 'rest-client'
require 'faker'
require 'net/http'
require 'openssl'

User.destroy_all
puts "All Users destroyed"
Garden.destroy_all
puts "All Gardens destroyed"
MyPlant.destroy_all
puts "All MyPlants destroyed"
Action.destroy_all
puts "All Actions destroyed"
# Plant.destroy_all
# puts "All Plants destroyed"

garden_names = [
  "Outside",
  "Inside",
  "Office"
]

# plant_names = [
#   "monstera deliciosa",
#   "ficus lyrata",
#   "yucca recurvifolia",
#   "cylindropuntia leptocaulis",
#   "abutilon palmeri",
#   "acacia farnesiana",
#   "ficus lyrata",
#   "angelonia angustifolia",
#   "prunus triloba",
#   "laurentia axillaris",
#   "dryopteris bushiana",
#   "stenotaphrum helferi",
#   "ferocactus histrix",
#   "acer campestre",
#   "acer spicatum",
#   "celosia plumosa",
#   "dianthus plumarius",
#   "prunus mume",
#   "fern",
#   "monstera friedrichsthalii"
# ]


User.create(email: "plant@life.com", password: "secret", first_name: "Vitaliy", last_name: "Lovesplants")

# def create_plant(url)
#   plant_api_key = ENV['plant_api']
#   plant_hash = RestClient.get(url, {:Authorization => "Bearer #{plant_api_key}"})
#   common_name = JSON.parse(plant_hash)["alias"]
#   temperature = JSON.parse(plant_hash)["max_temp"].to_s
#   light = JSON.parse(plant_hash)["max_light_lux"].to_s
#   water = JSON.parse(plant_hash)["max_soil_moist"].to_s
#   soil = JSON.parse(plant_hash)["max_soil_ec"].to_s
#   scientific_name = JSON.parse(plant_hash)["display_pid"]
#   img = JSON.parse(plant_hash)["image_url"]
#   file = URI.open(img)
#   p (common_name: common_name, scientific_name: scientific_name, temperature: temperature, sun: light, water: water, soil: soil)
#   plant.photo.attach(io: file, filename: "img", content_type: 'image/jpg')
#   p plant.save
# end
# plant_names.each do |p|
#   url = "https://open.plantbook.io/api/v1/plant/detail/#{p}/".gsub(' ', '%20')
#   create_plant(url)
# end



# url = URI("https://house-plants.p.rapidapi.com/all")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
# request = Net::HTTP::Get.new(url)
# request["X-RapidAPI-Host"] = 'house-plants.p.rapidapi.com'
# request["X-RapidAPI-Key"] = ENV['PLANT_API']

# response = http.request(request)
# plants_array = JSON.parse(response.read_body)

# plants_array.each do |plants_hash|
#   # p plants_hash
#   plants_hash["tempmin"] = plants_hash["tempmin"]["celsius"].to_s + "C"
#   plants_hash["tempmax"] = plants_hash["tempmax"]["celsius"].to_s + "C"
#   plants_hash["common"] = plants_hash["common"].first || plants_hash["latin"]
#   plants_hash.select! do |key, _value|
#     Plant.column_names.include?(key) && key != "id"
#   end

#   Plant.create!(plants_hash)
# end

# commmon: Snake plant
# common: "Splitleaf Philodendron"
# common: "Rubber plant"
# common: "Burro tail"
# common: "Fernleaf Philodendron"
# common: "Peace Lily"
# common: "Fernleaf Philodendron"
# common: "Maidenhair Fern"
# common: "Lady palm"
# common: "Golden Pothos"
my_plants = [
  {
    nickname: "Snakey",
    photo_url: "https://images.unsplash.com/photo-1599009944997-3544a939813c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
    plant: Plant.find_by(common: "Snake plant"),
    last_watered: Date.today - 7
  },
  {
    nickname: "Monsti",
    photo_url: "https://images.unsplash.com/photo-1602344571261-8399edc13b2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
    plant: Plant.find_by(common: "Splitleaf Philodendron"),
    last_watered: Date.today - 5
  },
  {
    nickname: "Chewi",
    photo_url: "https://images.unsplash.com/photo-1615804509230-86d839151e0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
    plant: Plant.find_by(common: "Rubber plant"),
    last_watered: Date.today - 3
  },
  {
    nickname: "Burrito",
    photo_url: "https://cdn.shopify.com/s/files/1/0591/2746/4141/products/857MonsteraRiesemitSTab-min.jpg",
    plant: Plant.find_by(common: "Burro tail"),
    last_watered: Date.today - 5
  },
  {
    nickname: "Aristotle",
    photo_url: "https://images.unsplash.com/photo-1615213861173-21494d7354de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3164&q=80",
    plant: Plant.find_by(common: "Fernleaf Philodendron"),
    last_watered: Date.today - 7
  },
  {
    nickname: "Lily",
    photo_url: "https://images.unsplash.com/photo-1620310252507-c65943dbd411?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1065&q=80",
    plant: Plant.find_by(common: "Peace Lily"),
    last_watered: Date.today - 7
  },
  {
    nickname: "Sansa",
    photo_url: "https://cdn.shopify.com/s/files/1/0591/2746/4141/products/857MonsteraRiesemitSTab-min.jpg",
    plant: Plant.find_by(common: "Maidenhair Fern"),
    last_watered: Date.today - 5
  },
  {
    nickname: "Goldi",
    photo_url: "https://cdn.shopify.com/s/files/1/0591/2746/4141/products/857MonsteraRiesemitSTab-min.jpg",
    plant: Plant.find_by(common: "Golden Pothos"),
    last_watered: Date.today - 6
  }
]

garden_names.each do |garden|
  Garden.create(name: garden, user: User.last)
end

my_plants.each do |plant_hash|
  file = URI.open(plant_hash[:photo_url])
  plant = MyPlant.new(
    plant: plant_hash[:plant],
    nickname: plant_hash[:nickname],
    last_watered: plant_hash[:last_watered],
    garden: Garden.all.sample
  )
  plant.photo.attach(
    io: file,
    filename: "#{plant_hash[:nickname]}",
    content_type: 'image/png'
  )
  plant.save!
end

# API STUFF WE NEED
# "latin":"Aeschynanthus lobianus" scientific
# "family":"Gesneriaceae" species
# "origin":"Java"
# "climate":"Tropical"
# "ideallight":"Bright light" sun
# "watering":"Keep moist between watering. Can be a bit dry between watering" watering
# "common" is an array use the first one
# "tempmax":{2 items temperature
# "celsius":32
# "tempmin":{2 items
# "celsius":14
