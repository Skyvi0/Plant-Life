class AddColumsToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :latin, :string
    add_column :plants, :family, :string
    add_column :plants, :origin, :string
    add_column :plants, :climate, :string
    add_column :plants, :ideallight, :string
    add_column :plants, :watering, :string
    add_column :plants, :common, :string
    add_column :plants, :tempmax, :string
    add_column :plants, :tempmin, :string
  end
end
