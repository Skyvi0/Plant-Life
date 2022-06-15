class MyPlant < ApplicationRecord
  belongs_to :garden
  belongs_to :plant, optional: true

  has_many :actions, dependent: :destroy
  has_one_attached :photo

  def days_ago
    ((last_watered - Date.today) * -1).to_i
  end

  def water?
    days_ago >= 7 ? true : false
  end

  def overdue
    overdue = days_ago - 7
    overdue <= 1 ? "due today" : "#{overdue} days overdue"
  end
end
