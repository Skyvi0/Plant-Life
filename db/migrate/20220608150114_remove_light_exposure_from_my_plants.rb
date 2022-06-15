class RemoveLightExposureFromMyPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column :my_plants, :light_exposure
  end
end
