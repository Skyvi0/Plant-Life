class Garden < ApplicationRecord
  belongs_to :user

  has_many :my_plants, dependent: :destroy
end
