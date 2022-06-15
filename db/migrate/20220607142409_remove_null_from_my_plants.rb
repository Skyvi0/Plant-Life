class RemoveNullFromMyPlants < ActiveRecord::Migration[6.1]
  def change
    change_column_null :my_plants, :plant_id, true
  end
end
