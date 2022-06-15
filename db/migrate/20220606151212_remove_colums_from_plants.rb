class RemoveColumsFromPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column :plants, :species, :string
    remove_column :plants, :common_name, :string
    remove_column :plants, :scientific_name, :string
    remove_column :plants, :water, :string
    remove_column :plants, :soil, :string
    remove_column :plants, :sun, :string
    remove_column :plants, :temperature, :string
  end
end
