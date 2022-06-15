class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :actions, dependent: :destroy
  has_many :gardens, dependent: :destroy
  has_many :my_plants, through: :gardens
end
