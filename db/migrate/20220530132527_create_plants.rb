class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :species
      t.string :common_name
      t.string :scientific_name
      t.string :water
      t.string :soil
      t.string :sun
      t.string :temperature

      t.timestamps
    end
  end
end
