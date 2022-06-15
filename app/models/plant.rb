class Plant < ApplicationRecord
  has_many :my_plants
  # has_one_attached :photo
end
