class AddLastWateredToMyPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :my_plants, :last_watered, :date
  end
end
